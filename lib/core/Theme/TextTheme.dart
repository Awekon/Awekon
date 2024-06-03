import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(color: Colors.black, fontSize: 34),
    displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontFamily: 'primaryFont',
        fontWeight: FontWeight.w600),
    displaySmall: TextStyle(color: Colors.black, fontSize: 28),
    headlineLarge: TextStyle(color: Colors.black, fontSize: 26),
    headlineMedium: TextStyle(color: Colors.black, fontSize: 24),
    headlineSmall: TextStyle(color: Colors.black, fontSize: 22),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
    bodySmall: TextStyle(color: Colors.black, fontSize: 12),
    labelLarge: TextStyle(color: Colors.white, fontSize: 18),
    labelMedium: TextStyle(color: Colors.white, fontSize: 16),
    labelSmall: TextStyle(color: Colors.white, fontSize: 14),
    titleLarge: TextStyle(color: Colors.black, fontSize: 22),
    titleMedium: TextStyle(color: Colors.black, fontSize: 18),
    titleSmall: TextStyle(color: Colors.black, fontSize: 16),
  );

  static TextTheme darkTextTheme = const TextTheme(
    // Define text styles with white color for dark theme
    displayLarge: TextStyle(color: Colors.white, fontSize: 34),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontFamily: 'primaryFont',
    ),
    displaySmall: TextStyle(color: Colors.white, fontSize: 28),
    headlineLarge: TextStyle(color: Colors.white, fontSize: 26),
    headlineMedium: TextStyle(color: Colors.white, fontSize: 24),
    headlineSmall: TextStyle(color: Colors.white, fontSize: 22),
    bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
    bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    labelLarge: TextStyle(color: Colors.black, fontSize: 18),
    labelMedium: TextStyle(color: Colors.black, fontSize: 16),
    labelSmall: TextStyle(color: Colors.black, fontSize: 14),
    titleLarge: TextStyle(color: Colors.white, fontSize: 22),
    titleMedium: TextStyle(color: Colors.white, fontSize: 18),
    titleSmall: TextStyle(color: Colors.white, fontSize: 16),
  );
}
