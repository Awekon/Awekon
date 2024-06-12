import 'package:awekon/components/ui_components/Collections%20of%20you%20Horizontal%20Scroll/Views/BookCardCollection.dart';
import 'package:flutter/material.dart';

class HorizontalBookListCollection extends StatelessWidget {
  const HorizontalBookListCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended for You',
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
              BookCardCollection(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhfxwS7UCa0-G6mpXKLsq8a3TuXnIH22-bbDmfsFNd34URJgaBjxn5MZBz-w-t3M5dCU&usqp=CAU',
                title: 'The Ocean',
                author: 'Sken Alemse',
                about: 'An uplifting story about two best friends, Isaac and James, and their discovery of the cause and effect relationship between our cities storm drains and the worlds oceans, lakes and rivers.',
              ),
              BookCardCollection(
                imageUrl: 'https://m.media-amazon.com/images/I/61-jXBghiaL._AC_UF1000,1000_QL80_.jpg',
                title: 'Chasing Dreams',
                author: 'Lexi Azelart',
                about: ' you will have no regrets because you will know that you gave it your all and pursued what truly mattered to you',
              ),
              BookCardCollection(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6gcuvMpQmiqNKARNsKbzYBqD2wXJCyiC2vIRG9aFcA6rJS81DyGLJLKyqxZy2nBS6B8A&usqp=CAU',
                title: 'Whispers of',
                author: 'Aura Dodnks',
                about:'Talking in Whispers is a story about how young people struggle to survive in a country under martial law.' ,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
