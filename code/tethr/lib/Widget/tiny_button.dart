import 'package:flutter/material.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/custom_icons_icons.dart';

class TinyButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final IconData icon;
  final String label;
  final Color containerColor;
  final Color textColor;
  final Color iconColor;

  const TinyButton({
    super.key,
    required this.icon,
    required this.label,
    required this.containerColor,
    this.textColor = kBlackText,
    this.iconColor = kBlackText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Center(
            child: Column(
              children: [
                Icon(icon, color: iconColor),
                Text(label,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        fontFamily: 'Lexend')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
