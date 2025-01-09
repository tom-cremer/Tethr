import 'package:flutter/material.dart';
import 'package:tethr/Styles/card_styles.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Widget/card_background.dart';


class CardStack extends StatelessWidget {
  final Map<String, dynamic> userData;

  const CardStack({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final gradient =
        GradientStyles.getGradient(userData['activeItems']['iconDecoration']);

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
            maxWidth: kLargeCardWidth, maxHeight: kLargeCardHeight ),
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
                        '${userData['firstName']} ${userData['lastName']}',
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
                        '@${userData['username']}',
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
              Text('${userData['links']}',
                  style: const TextStyle(
                      color: kWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lexend')),
            ],
          ),
        ),
      ),
    ]);
  }
}
