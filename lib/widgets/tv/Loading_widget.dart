import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late VideoPlayerController _videoPlayerController;

  void initState() {
    super.initState();
    /* Initialize the video player.*/
    _videoPlayerController =
        VideoPlayerController.asset("videos/SplashScreen.mp4");
  }

  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  Widget build(BuildContext context) {
    // return Chewie(controller: _chewieController);
    // return Image.asset("videos/sample_gif.gif");
    return Center(child: VideoPlayer(_videoPlayerController));
  }
}
