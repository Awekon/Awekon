import 'package:awekon/core/Theme/TextTheme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static Color PRIMARY_COLOR_DARK = const Color(0xff2a011a);
  static Color SECONDARY_DARK = const Color(0xFFF8E1FF);
  static Color PRIMARY_COLOR = SECONDARY_DARK;
  static Color SECONDARY = PRIMARY_COLOR_DARK;
  static Color ACCENT = const Color(0xFF393956);
  static Color SELECTED = const Color(0xFF0E0E79);
  static Color SELECTED_DARK = const Color(0xFFE0E0EC);

  // Code for light theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: SECONDARY,
    focusColor: SECONDARY,
    hintColor: SECONDARY,
    scaffoldBackgroundColor: PRIMARY_COLOR,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
        primary: SECONDARY,
        onPrimary: PRIMARY_COLOR,
        secondary: PRIMARY_COLOR,
        onSecondary: SECONDARY,
        surface: PRIMARY_COLOR,
        onSurface: SECONDARY,
        brightness: Brightness.light,
        error: Colors.blueGrey,
        onError: Colors.white),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: SECONDARY),
    ),
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(ACCENT),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: PRIMARY_COLOR,
      unselectedIconTheme: IconThemeData(color: SECONDARY),
      unselectedItemColor: SECONDARY,
      selectedItemColor: SELECTED,
      selectedIconTheme: IconThemeData(color: SELECTED),
    ),
  );

  // Code for dark theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: SECONDARY_DARK, // Slate Blue
    hintColor: SECONDARY_DARK,
    focusColor: SECONDARY_DARK, // Sand
    scaffoldBackgroundColor: PRIMARY_COLOR_DARK,
    colorScheme: ColorScheme(
        primary: SECONDARY_DARK,
        onPrimary: PRIMARY_COLOR_DARK,
        secondary: PRIMARY_COLOR_DARK,
        onSecondary: SECONDARY_DARK,
        surface: PRIMARY_COLOR_DARK,
        onSurface: SECONDARY_DARK,
        brightness: Brightness.dark,
        error: Colors.white,
        onError: Colors.blueGrey),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: SECONDARY_DARK),
    ),
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ACCENT),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: PRIMARY_COLOR_DARK,
      unselectedIconTheme: IconThemeData(color: SECONDARY_DARK),
      unselectedItemColor: SECONDARY_DARK,
      selectedIconTheme: IconThemeData(color: SELECTED_DARK),
      selectedItemColor: SECONDARY_DARK,
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
