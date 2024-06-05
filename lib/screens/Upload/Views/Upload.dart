import 'package:flutter/material.dart';
import 'package:awekon/config/size_config.dart';
class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Upload",
          style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier,
          ),
        ),
      ),
    );
  }
}
