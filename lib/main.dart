import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/NavigationItem/SystemNavigation.dart';
import 'package:awekon/core/Theme/Theme.dart';
import 'package:awekon/screens/SlashScreen/Veiws/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeModeNotifier>(
      create: (_) => ThemeModeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Consumer<ThemeModeNotifier>(
      builder: (_, themeModeNotifier, __) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: AppThemes.isDark(context)
                ? AppThemes.darkColorScheme.surface
                : AppThemes.lightColorScheme.surface,
            statusBarIconBrightness: AppThemes.isDark(context)
                ? Brightness.light
                : Brightness.dark));

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeModeNotifier.themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          home: const SplashScreen(),
          getPages: getSystemPages,
        );
      },
    );
  }
}

class ThemeModeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
