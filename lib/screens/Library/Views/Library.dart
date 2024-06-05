import 'package:flutter/material.dart';
import '../../../config/size_config.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Library",
          style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier,
          ),
        ),
      ),
    );
  }
}
