import 'package:flutter/material.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/texts.dart';
import 'package:tethr/Widget/card_background.dart';
import 'package:dto/models.dart' as dto;
import 'package:tethr/custom_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class CardStack extends StatefulWidget {
  final String? uid;

  CardStack({super.key, this.uid});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  dto.User? userData;
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await FirestoreHelper.getUserDataByUid(widget.uid);
      setState(() {
        this.userData = userData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            showCloseIcon: true,
            backgroundColor: kGrayLight,
            content: Text(kErrorFetchUser)),
      );
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradient = GradientStyles.getGradient(userData?.activeItems.banner);

    return Stack(children: [
      CardWidget(
        gradient: gradient,
        width: kLargeCardWidth,
        height: kLargeCardHeight,
        radius: kLargeCardRadius,
        iconSize: kLargeCardIconSize,
      ),
      ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: kLargeCardWidth, maxHeight: kLargeCardHeight),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Card Holder',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lexend'),
                      ),
                      Text(
                        '${userData?.firstName} ${userData?.lastName}',
                        style: const TextStyle(
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend'),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Card Username',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Lexend'),
                      ),
                      Text(
                        '@${userData?.username}',
                        style: const TextStyle(
                            color: kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend'),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: gradient.colors[0],
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/default_profile.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildLinksButton(userData),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildLinksButton(dto.User? userData) {
    final links = userData?.links;
    return Wrap(
        spacing: 7,
        runSpacing: 4,
        children: [
          ...links?.map((link) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(Uri.parse(link!));
                });
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: kWhite.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                padding: const EdgeInsets.all(10),
                child: Center(child: const Icon(CustomIcons.link)),
              ),
            );
          }).toList() ??
              [Container()],
        ]
    );
  }
}
