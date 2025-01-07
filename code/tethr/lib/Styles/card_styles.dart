import 'package:flutter/material.dart';

class GradientStyles {
  static const purple = LinearGradient(
    colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const pink = LinearGradient(
    colors: [Color(0xFFF7749C), Color(0xFFD33465)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const orange = LinearGradient(
    colors: [Color(0xFFFFA751), Color(0xFFFF7C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const blue = LinearGradient(
    colors: [ Color(0xFF1488CC), Color(0xFF2B32B2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

const kCardBlurRadius = 5.0;

const kSmallCardWidth = 52.0;
const kSmallCardHeight = 34.0;
const kSmallCardRadius = 5.0;
const kSmallCardIconSize = 26.0;

const kMediumCardWidth = 150.0;
const kMediumCardHeight = 99.0;
const kMediumCardRadius = 10.0;
const kMediumCardIconSize = 77.0;

const kLargeCardWidth = 336.0;
const kLargeCardHeight = 221.0;
const kLargeCardRadius = 20.0;
const kLargeCardIconSize = 173.0;
