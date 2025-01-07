import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tethr/Styles/colors.dart';

class LogoOnboarding extends StatelessWidget {
  final String title;

  final String subtitle;

  const LogoOnboarding({super.key, this.title = 'Tethr', this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            fit: BoxFit.cover,
          ),
          Text(
            title,
            style: const TextStyle(
                color: kBlackText,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'Lexend'),
          ),
        ],
      ),
      Text(
        subtitle,
        style: const TextStyle(
            color: kBlackText,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: 'Lexend'),
      ),
    ]);
  }
}
