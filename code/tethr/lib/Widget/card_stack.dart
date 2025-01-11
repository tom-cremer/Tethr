import 'package:flutter/material.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_background.dart';
import 'package:dto/models.dart' as dto;
import 'package:url_launcher/url_launcher.dart';

class CardStack extends StatefulWidget {
  dto.User? userData;
  dto.Follow? follower;

  CardStack({super.key, this.userData, this.follower});

  @override
  State<CardStack> createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  Future<void>? _launched;

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
        widget.userData?.activeItems.banner ??
            widget.follower?.activeItems.banner);

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
                        '${widget.userData?.firstName ?? widget.follower?.firstName} ${widget.userData?.lastName ?? widget.follower?.lastName}',
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
                        '@${widget.userData?.username ?? widget.follower?.username}',
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
              _buildLinksButton(widget.userData, widget.follower),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildLinksButton(dto.User? userData, dto.Follow? follower) {
    final links = userData?.links ?? follower?.links;
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
