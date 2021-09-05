import 'package:adonai/models/Sermons.dart';
import 'package:adonai/widgets/tv/video_screen_widget.dart';

import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final Sermon sermon;

  const VideoScreen({Key? key, required this.sermon}) : super(key: key);
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoDetailsWidget(
        sermon: widget.sermon,
      ),
    );
  }
}
