import 'package:awekon/core/constants/size_config.dart';
import 'package:awekon/screens/SlashScreen/Veiws/splashScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig mainSize = SizeConfig(context);

    if (kDebugMode) {
      print("container: ${mainSize.blockSizeVertical}");
    }
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: splashScreen());
  }
}
