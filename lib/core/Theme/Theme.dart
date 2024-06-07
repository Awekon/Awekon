import 'package:awekon/core/Theme/TextTheme.dart';
import 'package:flutter/material.dart';

// class AppThemes {
//   static const LinearGradient GRADIENT_LIGHT = LinearGradient(
//     colors: [
//       Color.fromRGBO(209, 179, 219, 1), // rgba(94,18,8,1)
//       Color.fromRGBO(216, 134, 244, 1), // rgba(115,101,82,1)
//     ],
//     stops: [0.26, 0.76],
//     begin: Alignment.centerLeft,
//     end: Alignment.centerRight,
//   );
//
//   static const LinearGradient GRADIENT_DARK = LinearGradient(
//     colors: [
//       Color.fromRGBO(82, 6, 49, 1.0), // rgba(94,18,8,1)
//       Color.fromRGBO(98, 61, 110, 1), // rgba(115,101,82,1)
//     ],
//     stops: [0.26, 0.76],
//     begin: Alignment.centerLeft,
//     end: Alignment.centerRight,
//   );
//
//   static const LinearGradient GRADIENT_LIGHT_BACKGROUND = LinearGradient(
//     colors: [
//       Color.fromRGBO(248, 225, 255, 1),
//       Color.fromRGBO(102, 8, 65, 1),
//     ],
//     stops: [0.20, 0.80],
//     begin: Alignment.centerLeft,
//     end: Alignment.centerRight,
//   );
//
//   static const LinearGradient GRADIENT_DARK_BACKGROUND = LinearGradient(
//     colors: [
//       Color.fromRGBO(42, 1, 26, 1), // rgba(94,18,8,1)
//       Color.fromRGBO(98, 61, 110, 1), // rgba(115,101,82,1)
//     ],
//     stops: [0.26, 0.76],
//     begin: Alignment.centerLeft,
//     end: Alignment.centerRight,
//   );
//
//   static Color PRIMARY_COLOR_DARK = const Color(0xff3b0126);
//   static Color SECONDARY_DARK = const Color(0xFFEDBBFC);
//   static Color PRIMARY_COLOR = SECONDARY_DARK;
//   static Color SECONDARY = PRIMARY_COLOR_DARK;
//   static Color ACCENT = const Color(0xFF393956);
//   static Color SELECTED = const Color(0xFFA61A89);
//   static Color SELECTED_DARK = const Color(0xFFE07EF3);
//   static Color BACKGROUND = const Color(0xFFF5F2FA);
//   static Color BACKGROUND_DARK = const Color(0xff0a0109);
//   static Color APPBAR_DARK = const Color(0xff180313);
//   static Color APPBAR = const Color(0xFFF0EBF8);
//
//   static ThemeData lightTheme = ThemeData(
//     primaryColor: SECONDARY,
//     focusColor: SECONDARY,
//     hintColor: SECONDARY,
//     scaffoldBackgroundColor: BACKGROUND,
//     brightness: Brightness.light,
//     colorScheme: ColorScheme(
//         primary: SECONDARY,
//         onPrimary: PRIMARY_COLOR,
//         secondary: PRIMARY_COLOR,
//         onSecondary: SECONDARY,
//         surface: BACKGROUND,
//         tertiary: PRIMARY_COLOR,
//         tertiaryContainer: SELECTED,
//         onSurface: SECONDARY,
//         brightness: Brightness.light,
//         error: Colors.blueGrey,
//         onError: Colors.white),
//     appBarTheme: AppBarTheme(
//       color: APPBAR,
//       elevation: 0,
//       iconTheme: IconThemeData(color: SECONDARY),
//     ),
//     iconTheme: IconThemeData(color: SECONDARY),
//     textTheme: CustomTextTheme.lightTextTheme,
//     elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ButtonStyle(
//       backgroundColor: WidgetStateProperty.all<Color>(ACCENT),
//       foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
//     )),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: APPBAR,
//       selectedItemColor: SELECTED,
//       selectedIconTheme: IconThemeData(color: SELECTED, size: 30),
//       unselectedIconTheme: IconThemeData(color: SECONDARY),
//       unselectedItemColor: SECONDARY,
//     ),
//   );
//
//   // Code for dark theme
//   static ThemeData darkTheme = ThemeData(
//     primaryColor: SECONDARY_DARK, // Slate Blue
//     hintColor: SECONDARY_DARK,
//     focusColor: SECONDARY_DARK, // Sand
//     scaffoldBackgroundColor: BACKGROUND_DARK,
//     colorScheme: ColorScheme(
//         primary: SECONDARY_DARK,
//         onPrimary: PRIMARY_COLOR_DARK,
//         secondary: PRIMARY_COLOR_DARK,
//         onSecondary: SECONDARY_DARK,
//         tertiary: PRIMARY_COLOR_DARK,
//         tertiaryContainer: SELECTED_DARK,
//         surface: BACKGROUND_DARK,
//         onSurface: SECONDARY_DARK,
//         brightness: Brightness.dark,
//         error: Colors.white,
//         onError: Colors.blueGrey),
//     brightness: Brightness.dark,
//     appBarTheme: AppBarTheme(
//       color: APPBAR_DARK,
//       elevation: 0,
//       iconTheme: IconThemeData(color: SECONDARY_DARK),
//     ),
//     iconTheme: IconThemeData(color: SECONDARY_DARK),
//     textTheme: CustomTextTheme.darkTextTheme,
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: WidgetStateProperty.all<Color>(ACCENT),
//         foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
//       ),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: APPBAR_DARK,
//       selectedIconTheme: IconThemeData(color: SELECTED_DARK, size: 30),
//       selectedItemColor: SELECTED_DARK,
//       unselectedIconTheme: IconThemeData(color: SECONDARY_DARK),
//       unselectedItemColor: SECONDARY_DARK,
//     ),
//   );
//
//   static ThemeData getTheme(BuildContext context) {
//     final Brightness brightnessValue =
//         MediaQuery.of(context).platformBrightness;
//     bool isDark = brightnessValue == Brightness.dark;
//
//     return isDark ? darkTheme : lightTheme;
//   }
//
//   static bool isDark(BuildContext context) {
//     return MediaQuery.of(context).platformBrightness == Brightness.dark;
//   }
// }

class AppThemes {
  static Color SELECTED = const Color(0xFFA61A89);
  static Color SELECTED_DARK = const Color(0xFFE07EF3);

  static const LinearGradient GRADIENT_LIGHT = LinearGradient(
    colors: [
      Color.fromRGBO(209, 179, 219, 1), // rgba(94,18,8,1)
      Color.fromRGBO(216, 134, 244, 1), // rgba(115,101,82,1)
    ],
    stops: [0.26, 0.76],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient GRADIENT_DARK = LinearGradient(
    colors: [
      Color.fromRGBO(82, 6, 49, 1.0), // rgba(94,18,8,1)
      Color.fromRGBO(98, 61, 110, 1), // rgba(115,101,82,1)
    ],
    stops: [0.26, 0.76],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient GRADIENT_LIGHT_BACKGROUND = LinearGradient(
    colors: [
      Color.fromRGBO(224, 169, 245, 1.0),
      Color.fromRGBO(110, 4, 68, 0.9),
    ],
    stops: [0.20, 0.72],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient GRADIENT_DARK_BACKGROUND = LinearGradient(
    colors: [
      Color.fromRGBO(42, 1, 26, 1), // rgba(94,18,8,1)
      Color.fromRGBO(98, 61, 110, 1), // rgba(115,101,82,1)
    ],
    stops: [0.29, 0.76],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ColorScheme lightColorScheme = ColorScheme.light(
    // primary: const Color(0xFFECDDF5),
    primary: const Color(0xFF570632),
    // secondary: const Color(0xFF500243),
    secondary: const Color(0xFFEFBFE5),
    surface: const Color(0xFFEDD3F8),
    error: Colors.blueGrey,
    tertiary: SELECTED,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onError: Colors.white,
    onTertiary: Colors.white,
  );

  static ColorScheme darkColorScheme = ColorScheme.dark(
      // primary: const Color(0xFF570632),
      primary: const Color(0xFFECDDF5),
      // secondary: const Color(0xFFEFBFE5),
      secondary: const Color(0xFF500243),
      surface: const Color(0xFF280219),
      error: Colors.white,
      tertiary: SELECTED_DARK,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onError: Colors.blueGrey,
      onSurface: Colors.white,
      onTertiary: Colors.black);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: const Color(0xFFFAF5FD),
    appBarTheme: AppBarTheme(
      color: lightColorScheme.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: lightColorScheme.primary),
    ),
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(lightColorScheme.secondary),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColorScheme.surface,
      selectedItemColor: lightColorScheme.primary,
      unselectedItemColor: lightColorScheme.primary.withOpacity(0.7),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: const Color(0xFF050004),
    appBarTheme: AppBarTheme(
      color: darkColorScheme.surface,
      elevation: 0,
      iconTheme: IconThemeData(color: darkColorScheme.primary),
    ),
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(darkColorScheme.secondary),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: darkColorScheme.primary.withOpacity(0.7),
    ),
  );

  static ThemeData getTheme(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    return brightnessValue == Brightness.dark ? darkTheme : lightTheme;
  }

  static bool isDark(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}
