import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tethr/Styles/card_styles.dart';

class CardWidget extends StatelessWidget {
  final LinearGradient gradient;
  final double width;
  final double height;
  final double radius;
  final double iconSize;

  const CardWidget({
    super.key,
    required this.gradient,
    required this.width,
    required this.height,
    required this.radius,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: kCardBlurRadius,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/logo_single_color.svg',
                width: iconSize,
                height: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}