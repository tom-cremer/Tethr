import 'package:flutter/material.dart';
import 'package:tethr/Styles/colors.dart';
import 'package:tethr/Styles/spacings.dart';

class Button extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String label;

  final double verticalPadding;
  final double verticalMargin;
  final double horizontalMargin;
  final double borderRadius;

  final Color color;

  final dynamic child;

  const Button({
    this.label = '',
    this.child = null,
    this.onTap,
    this.verticalPadding = kButtonNavVertical,
    this.verticalMargin = kButtonNavVertical,
    this.horizontalMargin = kMarginDefault,
    this.borderRadius = kBorderRadius,
    this.color = kGreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            backgroundColor: color,
          ),
          onPressed: onTap,
          child: (child != null)
              ? child
              : Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kBlackText,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    fontFamily: 'Lexend',
                  ),
                ),
        ),
      ),
    );
  }
}
