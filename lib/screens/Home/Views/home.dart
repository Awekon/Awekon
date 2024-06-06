import 'package:awekon/components/ui_components/Custom%20Card/Views/CustomCard.dart';
import 'package:awekon/core/constants/font_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/ui_components/Trending Carousel/Views/carousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(fontSize: FontSize.large),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.trending_up_outlined),
                ],
              ),
            ),
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            Center(child: TrendingCarousel()),
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            const CustomCard(),
            const CustomCard(),
            const CustomCard(),
            const CustomCard(),
            const CustomCard(),
          ],
        ),
      ),
    );
  }

  void profileIconPressed() {
    if (kDebugMode) {
      print("pressed on icon");
    }
  }
}
