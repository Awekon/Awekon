import 'dart:async';

import 'package:awekon/core/Theme/Theme.dart';
import 'package:awekon/screens/OnBoardingScreen/Views/OnBoardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String getLottieAsset() {
    // Get the current theme mode

    // Return the appropriate Lottie asset based on the theme mode
    return AppThemes.isDark(context)
        ? 'assets/animations/Awekon_dark.json'
        : 'assets/animations/Awekon_light.json';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Apply background color from the theme
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Lottie.asset(
          getLottieAsset(), // Use the function to get the appropriate Lottie asset
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
