import 'package:awekon/core/constants/font_size.dart';
import 'package:awekon/core/constants/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map> onBoardingContent = [
    {
      "text": "Here you can create content",
      "image": "https://source.unsplash.com/400x380/?portrait"
    },
    {
      "text": "Here you can engaged with community and collaborate",
      "image": "https://source.unsplash.com/400x380/?portrait&media"
    },
    {
      "text": "Here you can listen content",
      "image": "https://source.unsplash.com/400x380/?portrait"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 5,
              child: PageView.builder(
                itemCount: onBoardingContent.length,
                itemBuilder: (context, index) => OnBoardingContent(text: onBoardingContent[index]["text"], image: onBoardingContent[index]["image"]),
              )
            ),
            const Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text("Image")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key, required this.text, required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          "Awekon",
          style: TextStyle(
              fontSize: FontSize.extraLarge,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
        ),
        Image.network(image,height: SizeConfig.blockSizeVertical*90, width: SizeConfig.blockSizeHorizontal*70,)
    ]
    );
  }
}
