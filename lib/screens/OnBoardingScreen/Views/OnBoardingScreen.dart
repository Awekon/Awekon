import 'package:awekon/screens/OnBoardingScreen/Views/components/body.dart';
import 'package:flutter/material.dart';

class OnBoardingscreen extends StatefulWidget {
  const OnBoardingscreen({super.key});

  @override
  State<OnBoardingscreen> createState() => _OnBoardingscreenState();
}

class _OnBoardingscreenState extends State<OnBoardingscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}


