import 'package:awekon/core/Theme/TextTheme.dart';
import 'package:flutter/material.dart';

Color averageColor(List<Color> colors) {
  int red = 0, green = 0, blue = 0;
  for (var color in colors) {
    red += color.red;
    green += color.green;
    blue += color.blue;
  }
  int count = colors.length;
  return Color.fromARGB(
    255,
    (red / count).round(),
    (green / count).round(),
    (blue / count).round(),
  );
}

class AppThemes {
  static final List<Color> gradientColors = [
    const Color.fromRGBO(240, 104, 104, 1),
    const Color.fromRGBO(148, 56, 44, 1),
    const Color.fromRGBO(98, 67, 20, 1),
    const Color.fromRGBO(101, 18, 15, 1),
    const Color.fromRGBO(227, 154, 52, 1),
  ];
  static Color PRIMARY_COLOR = const Color(0xFFEA817A);
  static Color ACCENT_COLOR = const Color(0xFF310704);
  // static Color PRIMARY_COLOR = averageColor(gradientColors);
  static Color PRIMARY_COLOR_DARK = const Color(0xFF5E1208);
  static Color ACCENT_COLOR_DARK = const Color(0xFFB79897);
  static ThemeData lightTheme = ThemeData(
    primaryColor: PRIMARY_COLOR,
    // primarySwatch: Colors.deepOrange,
    focusColor: PRIMARY_COLOR,
    hintColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: PRIMARY_COLOR,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    textTheme: CustomTextTheme.lightTextTheme,

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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: PRIMARY_COLOR,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        selectedItemColor: Colors.black),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: PRIMARY_COLOR_DARK, // Slate Blue
      hintColor: PRIMARY_COLOR_DARK,
      focusColor: PRIMARY_COLOR_DARK, // Sand
      scaffoldBackgroundColor: Colors.black, // black
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        color: PRIMARY_COLOR_DARK,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      textTheme: CustomTextTheme.darkTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(const Color(0xFFBED8FE)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: PRIMARY_COLOR_DARK,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white));

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
