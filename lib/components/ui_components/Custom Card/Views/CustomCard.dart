import 'package:awekon/config/size_config.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 0.01 * MediaQuery.of(context).size.height),
      width: 0.9 * MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://source.unsplash.com/random'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            width: 0.3 * MediaQuery.of(context).size.width,
            height: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.elliptical(40, 70),
                  bottomRight: Radius.elliptical(40, 70)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is description...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 3 * SizeConfig.blockSizeVertical,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '10 Chapters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10 * SizeConfig.blockSizeHorizontal),
                  ],
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.0, bottom: 2.5),
                    child: CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://source.unsplash.com/random")),
                  ),
                )
              ]),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 50,
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 3.0, bottom: 2.5),
              child: Text(
                '56:18',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
