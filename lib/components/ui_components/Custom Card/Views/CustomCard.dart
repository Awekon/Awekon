import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Background Image
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage('https://source.unsplash.com/random'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        // Semi-transparent overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        // Content
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is description...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '10 Chapters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    // backgroundImage: NetworkImage(),
                  ),
                  Text(
                    '56:18',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
