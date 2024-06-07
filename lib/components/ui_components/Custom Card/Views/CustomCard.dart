import 'package:awekon/config/size_config.dart';
import 'package:awekon/core/utils/Functions.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.thumbnailUrl,
      required this.title,
      this.time,
      required this.description});
  final String thumbnailUrl, title, description;
  final String? time;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    const borderRadius = 1.0;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 0.002 * MediaQuery.of(context).size.height),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (9 / 16),
      decoration: BoxDecoration(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: Colors.grey,
            width: 0.7,
          )),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.thumbnailUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Container(
            width: 0.3 * MediaQuery.of(context).size.width,
            height: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                  topRight: Radius.elliptical(40, 70),
                  bottomRight: Radius.elliptical(40, 70)),
            ),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(widget.title, 3),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    truncateTitle(widget.description, 5),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10 * SizeConfig.blockSizeHorizontal),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, bottom: 2.5),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.2,
                      ),
                    ),
                    child: const CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://source.unsplash.com/random")),
                  ),
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 50,
              ),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
