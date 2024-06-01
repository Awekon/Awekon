import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF64C9CF), // Turquoise
    hintColor: const Color(0xFFEE8959), // Coral
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF64C9CF),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      // Define text styles with black color for light theme
      displayLarge: TextStyle(color: Colors.black, fontSize: 24),
      displayMedium: TextStyle(color: Colors.black, fontSize: 22),
      displaySmall: TextStyle(color: Colors.black, fontSize: 20),
      headlineLarge: TextStyle(color: Colors.black, fontSize: 18),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 16),
      headlineSmall: TextStyle(color: Colors.black, fontSize: 14),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      bodySmall: TextStyle(color: Colors.black, fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      // Define button theme properties for light theme
      buttonColor: Color(0xFF64C9CF), // Turquoise
      textTheme: ButtonTextTheme.primary,
    ),
    // Define other properties for the light theme
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF5B7C8D), // Slate Blue
    hintColor: const Color(0xFFDAA588), // Sand
    scaffoldBackgroundColor: Colors.black, // black
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF5B7C8D),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      // Define text styles with white color for dark theme
      displayLarge: TextStyle(color: Colors.white, fontSize: 24),
      displayMedium: TextStyle(color: Colors.white, fontSize: 22),
      displaySmall: TextStyle(color: Colors.white, fontSize: 20),
      headlineLarge: TextStyle(color: Colors.white, fontSize: 18),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 16),
      headlineSmall: TextStyle(color: Colors.white, fontSize: 14),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    ),
    buttonTheme: const ButtonThemeData(
      // Define button theme properties for dark theme
      buttonColor: Color(0xFF5B7C8D), // Slate Blue
      textTheme: ButtonTextTheme.primary,
    ),
    // Define other properties for the dark theme
  );

  static ThemeData getTheme(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;

    return isDark ? darkTheme : lightTheme;
  }

  static bool isDark(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
