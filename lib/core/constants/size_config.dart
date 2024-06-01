import 'package:flutter/widgets.dart';

class SizeConfig {
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  late double textMultiplier;
  late double imageSizeMultiplier;
  late double heightMultiplier;

  bool isPortrait = true;
  bool isMobilePortrait = false;

  SizeConfig(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    isMobilePortrait = isPortrait && screenWidth < 450;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
  }
}

Size getWidgetSize(BuildContext context, GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  return renderBox.size;
}
