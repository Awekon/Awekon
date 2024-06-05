import 'package:flutter/material.dart';

import '../../../config/size_config.dart';

class Glimpse extends StatefulWidget {
  const Glimpse({super.key});

  @override
  State<Glimpse> createState() => _GlimpseState();
}

class _GlimpseState extends State<Glimpse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Glimpse",
          style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier,
          ),
        ),
      ),
    );
  }
}
