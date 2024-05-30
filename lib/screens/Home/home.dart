import 'package:awekon/assets/fonts/font_size.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://source.unsplash.com/50x50/?portrait',
            ),
          ),
        ),
        title: const Text(
            "Home",
          style: TextStyle(
            fontSize: fontSize.medium
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              "Home",
            style: TextStyle(
              fontSize: fontSize.large
            ),
              ),
            ),
        ],
      ),
    );
  }
}
