import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static const fontFamily = 'Inter';

  static const TextTheme textTheme = TextTheme(
    // Display
    displayLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w700,
      height: 1.1,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w700,
      height: 1.1,
      letterSpacing: -1,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      height: 1.15,
    ),

    // Headline
    headlineLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      height: 1.25,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.35,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.7,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.4,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
  );
}
