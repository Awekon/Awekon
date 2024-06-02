import 'package:awekon/config/size_config.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // Check if _containerKey has a valid context before getting its size

    return Scaffold(
      body: Center(
        child: Text(
          "Setting",
          style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier,
          ),
        ),
      ),
    );
  }
}
