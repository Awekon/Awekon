import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  navigate() {}

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
                  style: TextStyle(color: Colors.white),
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
