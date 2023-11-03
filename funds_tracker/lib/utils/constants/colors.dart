import 'package:flutter/material.dart';

class FColors {
  FColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF40A6DD);

  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFFFF9A9E),
      Color(0xFFFAD0C4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xFF6C757D);

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // Button Colors
  static const Color btnPrimary = Color(0xFF40A6DD);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Card components Colors
  static const Color redPrimary = Color(0xFFE9190C);
  static const Color redSecondary = Color(0x73E9190C);
  static const Color redTertiary = Color(0x2BE9190C);
  static const Color greenPrimary = Color(0xFF17D72A);
  static const Color greenSecondary = Color(0x7317D72A);
  static const Color greenTertiary = Color(0x2B17D72A);
  static const Color orangePrimary = Color(0xFFFFA012);
  static const Color orangeSecondary = Color(0x73FFA012);
  static const Color orangeTertiary = Color(0x2BFFA012);

  // Error/Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFFF4F4F4);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
