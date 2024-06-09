import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awekon/config/SharedPreference.dart';
import 'package:awekon/core/Theme/Theme.dart';
import 'package:awekon/core/constants/SharedPreferenceConstants.dart';
import 'package:awekon/screens/OnBoardingScreen/Views/OnBoardingScreen.dart';
import 'package:awekon/screens/SignUp/Views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget NextScreen = const OnBoardingScreen();

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final bool onboardingCompleted =
        await SharedPreferencesHelper.getValue<bool>(onBoardKey) ?? false;
    if (onboardingCompleted) {
      setState(() {
        NextScreen = const SignUp();
      });
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: LottieBuilder.asset(AppThemes.isDark(context)
              ? "assets/animations/Awekon_dark.json"
              : "assets/animations/Awekon_light.json"),
        ),
        nextScreen: NextScreen,
        splashIconSize: 400,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3500,
        backgroundColor:
            AppThemes.isDark(context) ? Colors.black : Colors.white,
      ),
    );
  }
}
