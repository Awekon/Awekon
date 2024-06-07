import 'package:awekon/components/ui_components/CustomVideoPlayer/CustomVideoPlayer.dart';
import 'package:flutter/material.dart';
// Adjust path as necessary

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String title;
  final String description;

  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomVideoPlayer(
                videoId: videoUrl,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
