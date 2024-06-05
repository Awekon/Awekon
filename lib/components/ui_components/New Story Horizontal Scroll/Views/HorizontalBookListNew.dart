import 'package:flutter/material.dart';
import 'BookCardNew.dart';

class HorizontalBookListNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'From Latest',
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
        const SizedBox(height: 8),
        const Text(
          'We think you will like these',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300, // Adjust the height according to your needs
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              BookCardNew(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvSDfOF3_uQah5GDn0tqtuVO8LxryljHW9ZLSayMxHRYP48Pi2Lk_VkkwhTznxStu5xIc&usqp=CAU',
                title: 'Journey to the Stars',
                author: 'James Sullivan',
              ),
              BookCardNew(
                imageUrl: 'https://m.media-amazon.com/images/I/71JTijUaBHL._AC_UF1000,1000_QL80_.jpg',
                title: 'A Journey of Imagination',
                author: 'Alexander Hayes',
              ),
              BookCardNew(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy77EoJVkHJ9iMACMbp60E8UaS3jGDdXJBHzSSlu9odONUKjp_n8goCPzOZPqEQId37aU&usqp=CAU',
                title: 'The Secret Key',
                author: 'Noah Ramsey',
              ),
              // Add more BookCard widgets here
            ],
          ),
        ),
      ],
    );
  }
}
