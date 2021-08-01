import 'package:adonai_2/constants/theme_info.dart';
import 'package:adonai_2/models/video_player_config.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoConfig videoConfig;

  const VideoPlayerScreen({Key? key, required this.videoConfig})
      : super(key: key);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;
  late var _focusNode = FocusNode();
  late int _tmpHashCode = 0;
  late var _focusControl = FocusNode();

  void initState() {
    super.initState();
    _focusNode.addListener(() {});
    _focusControl.addListener(() {});

    /* Disable screen sleep. */
    Wakelock.enabled;
    _initController();

    _focusNode.requestFocus();
  }

  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    _focusNode.dispose();
    _focusControl.dispose();
    /* Enable screen sleep. */
    Wakelock.disable();
  }

  Widget build(BuildContext context) {
    try {
      return WillPopScope(
        onWillPop: () async {
          if (widget.videoConfig.isLive) {
            Navigator.of(context).pop();
          }
          return true;
        },
        child: Scaffold(
          body: Chewie(controller: _chewieController),
        ),
      );
    } catch (e) {
      print(e);
      return Container(child: Text("Exception caught => $e"));
    }
  }

  Widget _popOnFailed() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Failed to load,",
            style: VideoPlayerThemeData.textTheme(Colors.grey)),
        Text("please try again later.",
            style: VideoPlayerThemeData.textTheme(Colors.grey)),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Go Back"))
      ],
    ));
  }

  void _initController() {
    _videoPlayerController =
        VideoPlayerController.network(widget.videoConfig.url);
    _chewieController = ChewieController(
      fullScreenByDefault: true,
      autoInitialize: true,
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      showOptions: false,
      isLive: widget.videoConfig.isLive,
      allowedScreenSleep: false,
      showControls: true,
      errorBuilder: (context, errorMessage) {
        return _popOnFailed();
      },
      overlay: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: Container(),
      ),
    );
  }

  void _handleKeyEvent(RawKeyEvent event) {
    /* For live videos we cant play pause or seek the video. */
    if (widget.videoConfig.isLive) {
      return;
    }
    setState(() {
      if ((event.runtimeType == RawKeyUpEvent) &&
          ((event.logicalKey == LogicalKeyboardKey.mediaPlayPause) ||
              (event.logicalKey == LogicalKeyboardKey.select))) {
        if (event.hashCode != _tmpHashCode) {
          _chewieController.togglePause();
          _tmpHashCode = event.hashCode;
        }
        _focusControl.requestFocus();
      }

      if ((event.physicalKey == PhysicalKeyboardKey.arrowRight) ||
          ((event.physicalKey == PhysicalKeyboardKey.arrowLeft))) {
        _seekVideo(event);
        _focusControl.requestFocus();
      }
    });
  }

  void _seekVideo(RawKeyEvent event) {
    int _seekBy = 5;
    int _timeToSeek = 0;

    if ((event.physicalKey == PhysicalKeyboardKey.arrowRight)) {
      /* Forward +5 sec. */
      if (_videoPlayerController.value.position.inSeconds + _seekBy <=
          _videoPlayerController.value.duration.inSeconds) {
        _timeToSeek = _videoPlayerController.value.position.inSeconds + _seekBy;
      } else {
        _timeToSeek = _videoPlayerController.value.duration.inSeconds;
      }
    } else {
      if (_videoPlayerController.value.position.inSeconds - _seekBy > 0) {
        _timeToSeek = _videoPlayerController.value.position.inSeconds - _seekBy;
      } else {
        _timeToSeek = 0;
      }
    }
    _chewieController.seekTo(Duration(seconds: _timeToSeek));
  }
}
