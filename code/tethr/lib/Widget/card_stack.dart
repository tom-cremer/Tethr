import 'package:flutter/material.dart';
import 'package:tethr/Helpers/firestore_helper.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_background.dart';
import 'package:dto/models.dart' as dto;
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
      if (userData == null) {
        throw Exception('User document not found in Firestore.');
      }
      
      setState(() {
        this.userData = userData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data: $e')),
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
    final gradient = GradientStyles.getGradient(
        userData?.activeItems.banner);

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
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: kBlack,
                        size: 30,
                      ),
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
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: links?.length ?? 0,
        itemBuilder: (context, index) {
          final link = links?[index];
          return IconButton(
            onPressed: () {
              setState(() {
                _launched = _launchInBrowser(Uri.parse(link!));
              });
            },
            icon: Icon(Icons.link),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        });
  }
}
