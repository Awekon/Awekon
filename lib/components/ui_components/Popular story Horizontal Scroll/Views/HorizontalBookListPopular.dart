import 'package:flutter/material.dart';
import 'BookCardPopular.dart';

class HorizontalBookListPopular extends StatelessWidget {
  const HorizontalBookListPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'More',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        SizedBox(
          height: 300, // Adjust the height according to your needs

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              BookCardPopular(
                imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1692012065i/196766063.jpg',
                title: 'Spectrum of Dream',
                author: 'Akes William',
              ),
              BookCardPopular(
                imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1344716136i/12788061.jpg',
                title: 'Dance of Shadows',
                author: 'Alex Yessc',
              ),
              BookCardPopular(
                imageUrl: 'https://m.media-amazon.com/images/I/61QEi7ia9OL._AC_UF1000,1000_QL80_.jpg',
                title: 'Mysteries of city',
                author: 'Mia Amseys',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
