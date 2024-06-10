import 'package:flutter/material.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';


class BookCardPopular extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const BookCardPopular({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: 175,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            author,
            style: const TextStyle(
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          const RatingBar.readOnly(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            initialRating: 4,
            maxRating: 5,
          )


        ],
      ),
    );
  }
}
