import 'package:awekon/core/constants/size_config.dart';
import 'package:awekon/screens/Home/Views/home.dart';
import 'package:awekon/screens/OnBoardingScreen/Views/OnBoardingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
