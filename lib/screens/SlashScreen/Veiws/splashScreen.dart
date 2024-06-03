import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awekon/screens/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: LottieBuilder.asset("assets/animations/Awekon_dark.json"),
        ),
        nextScreen: const SignUp(),
        splashIconSize: 400,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3500,
        backgroundColor: Colors.black);
  }
}
