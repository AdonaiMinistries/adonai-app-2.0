import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  void initState() {
    super.initState();
    /* Initialize the video player.*/
    _videoPlayerController =
        VideoPlayerController.asset("videos/SplashScreen.mp4");
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        fullScreenByDefault: true,
        autoPlay: true,
        autoInitialize: true,
        showControls: false);

    /* Start timer to check the play back. */
    Timer(Duration(seconds: 4), () => _handleTimeOut());
  }

  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  _handleTimeOut() {
    setState(() {
      _chewieController.pause();
      _videoPlayerController.pause();
      Navigator.pop(context);
    });
  }
}
