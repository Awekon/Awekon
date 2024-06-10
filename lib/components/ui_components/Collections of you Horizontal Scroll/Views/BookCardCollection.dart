import 'package:flutter/material.dart';


class BookCardCollection extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String about;

  const BookCardCollection({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.about,
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
          Text(
            about,
            style: const TextStyle(
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),


        ],
      ),
    );
  }
}
