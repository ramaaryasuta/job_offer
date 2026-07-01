import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'text_theme.dart';

class AppTheme {
  static ThemeData get light => const ColorTheme(
    fontFamily: AppTextTheme.fontFamily,
    textTheme: AppTextTheme.textTheme,
  ).light();

  static ThemeData get dark => const ColorTheme(
    fontFamily: AppTextTheme.fontFamily,
    textTheme: AppTextTheme.textTheme,
  ).dark();
}
