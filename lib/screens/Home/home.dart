import 'package:awekon/assets/fonts/font_size.dart';
import 'package:flutter/foundation.dart';
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
            padding: EdgeInsets.all(5.0),
            child: IconButton(
              icon: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  'https://source.unsplash.com/50x50/?portrait',
                ),
              ),
              onPressed: profileIconPressed,
            )),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: fontSize.medium),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: const Column(
        children: [
          Center(
            child: Text(
              "Home",
              style: TextStyle(fontSize: fontSize.large),
            ),
          ),
        ],
      ),
    );
  }
}

void profileIconPressed(){
  if (kDebugMode) {
    print("pressed on icon");
  }
}