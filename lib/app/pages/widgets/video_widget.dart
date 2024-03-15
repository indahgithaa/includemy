import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayerWidget({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return videoPlayerController != null && videoPlayerController.value.isInitialized
      ? Container(
          alignment: Alignment.topCenter,
          child: buildVideo(),
        )
      : Container(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => VideoPlayer(videoPlayerController);
}
