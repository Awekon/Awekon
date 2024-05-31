import 'package:awekon/screens/Home/Views/home.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  navigate() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextButton(
                onPressed: navigate,
                child: const Text(
                  "skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'primaryFont',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
        ],
      ),
      body: const Column(
        children: [Text("")],
      ),
    );
  }
}
