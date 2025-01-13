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
    return Material(
        color: Colors.transparent, // Set to transparent to avoid overriding the Ink color
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.grey.withOpacity(0.3),
          splashColor: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50.0),
          child: Ink(
            width: 90.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: containerColor, // Your background color
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures the button adjusts to its content
                  children: [
                    Icon(icon, color: iconColor),
                    Text(
                      label,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );


  }
}
