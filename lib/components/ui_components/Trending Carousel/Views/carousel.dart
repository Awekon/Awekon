import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'TrendingCard.dart';

class TrendingCarousel extends StatelessWidget {
  final List<TrendingItem> items = [
    TrendingItem('MANGA', 'Journey to the Stars', 'assets/images/sample/img_2.png', 'James Sullivan'),
    TrendingItem('Worldviews Explored', 'A Journey of Imagination', 'assets/images/sample/img.png', 'Alexander Hayes'),
    TrendingItem('Spectrum of Dreams', 'A Novel', 'assets/images/sample/img_1.png', 'Ethan Howard'),
    TrendingItem('Silence', 'Listen to the sound of silence', 'assets/images/sample/img_3.png', 'Ava Morgan'),
  ];

  const TrendingCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.33,
        enlargeCenterPage: true,
        viewportFraction: 0.60,
        enlargeFactor: 0.25,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: items.map((item) => Builder(
        builder: (BuildContext context) {
          return TrendingCard(item: item,);
        },
      )).toList(),
    );
  }
}




