import 'package:flutter/material.dart';
import 'package:soft_news_ai/styles/app_colors.dart';

ThemeData theme() {
  return ThemeData(
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'AdelleSans',
        ),
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'AdelleSans',
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        refreshBackgroundColor: Colors.white,
        linearMinHeight: 4.0, // Adjust as needed
        circularTrackColor: primaryColor, // Optional: Customize track color
      ));
}
