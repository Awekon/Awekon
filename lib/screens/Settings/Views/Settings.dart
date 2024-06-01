import 'package:awekon/core/constants/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key});
  static final GlobalKey _containerKey = GlobalKey();
  static late Size containerSize;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SizeConfig settingSizeSetting;

  @override
  Widget build(BuildContext context) {
    settingSizeSetting = SizeConfig(context);

    // Check if _containerKey has a valid context before getting its size

    if (kDebugMode) {
      print("setting: ${settingSizeSetting.blockSizeVertical}");
    }

    return Scaffold(
      body: Center(
        child: Text(
          "Setting",
          style: TextStyle(
            fontSize: 2 * settingSizeSetting.textMultiplier,
          ),
        ),
      ),
    );
  }
}
