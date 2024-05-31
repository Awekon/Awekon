import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awekon/screens/OnBoardingScreen/Views/OnBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: LottieBuilder.asset("assets/animations/Awekon_dark.json"),
        ),
        nextScreen: const OnBoardingScreen(),
        splashIconSize: 400,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3500,
        backgroundColor: Colors.black);
  }
}
