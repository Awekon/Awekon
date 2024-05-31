import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awekon/screens/Home/Views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
            Center(
              child: LottieBuilder.asset("assets/animations/Awekon_dark.json"),
        ), nextScreen: const Home(),
        // splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        duration: 4000,
        backgroundColor: Colors.black);

  }
}
