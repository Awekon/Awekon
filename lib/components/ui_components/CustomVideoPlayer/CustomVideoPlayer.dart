import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key, required this.videoId});
  final String videoId;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(() {
        if (controller.value.hasError) {
          print('Error loading video: ${controller.value.errorCode}');
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
          ),
          builder: (context, player) {
            return Column(
              children: [
                SizedBox(
                  height: (9 * MediaQuery.of(context).size.width) / 16,
                  width: MediaQuery.of(context).size.width,
                  child: player,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
