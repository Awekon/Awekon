import 'package:flutter/material.dart';

class AppThemes {
  static Color PRIMARY_COLOR = const Color(0xFF1A77BA);
  // static Color ACCENT_COLOR = const Color();
  static Color PRIMARY_COLOR_DARK = const Color(0xFF024F70);
  // static Color ACCENT_COLOR_DARK = const Color();
  static ThemeData lightTheme = ThemeData(
    primaryColor: PRIMARY_COLOR,
    hintColor: Colors.indigo, // Turquoise
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: PRIMARY_COLOR,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
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

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF00394B)),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    )),
    buttonTheme: const ButtonThemeData(
      // Define button theme properties for light theme
      buttonColor: Color(0xFF64C9CF), // Turquoise
      textTheme: ButtonTextTheme.normal,
    ),
    // Define other properties for the light theme
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: PRIMARY_COLOR_DARK, // Slate Blue
    hintColor: Colors.cyan, // Sand
    scaffoldBackgroundColor: Colors.black, // black
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: PRIMARY_COLOR_DARK,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(const Color(0xFFBED8FE)),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      ),
    ),
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
