import 'dart:ui'; // For image blur
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageLayout extends StatelessWidget {
  final Widget child;

  final bool showBackButton;

  const PageLayout(
      {required this.child, this.showBackButton = true, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/background.svg',
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showBackButton)
          Positioned(
            top: 25,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        SafeArea(child: child),
      ],
    );
  }
}
