import 'package:flutter/material.dart';

class TrendingItem {
  final String category;
  final String title;
  final String imagePath;
  final String author;

  TrendingItem(this.category, this.title, this.imagePath, this.author);
}

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.item,
  });

  final TrendingItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(item.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.author,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 10.0,
            right: 10.0,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/sample/img_4.png'),
            ),
          ),
          Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white.withOpacity(0.8),
              size: 64.0,
            ),
          ),
        ],
      ),
    );
  }
}
