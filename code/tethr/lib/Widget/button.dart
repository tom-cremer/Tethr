import 'package:flutter/material.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/spacings.dart';

class Button extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String label;

  const Button({
    required this.label,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kMarginDefault,
        vertical: kButtonNavVertical,
      ),
      child: SizedBox(
        width: double.infinity, // Makes the button take all horizontal space
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: kButtonNavVertical, // Removed horizontal padding to use full width
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            backgroundColor: kGreen,
          ),
          onPressed: onTap,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kBlackText,
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}



/*style: TextStyle(
            color: kBlackText,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
*/