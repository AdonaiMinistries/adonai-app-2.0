import 'package:adonai/bloc/video_player/video_player_bloc.dart';
import 'package:adonai/bloc/video_player/video_player_event.dart';
import 'package:adonai/constants/theme_info.dart';
import 'package:adonai/models/video_player_config.dart';
import 'package:adonai/widgets/tv/video_player/video_player_widget.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

//////////////////////////////////////////////////////////////////////////////
///
/// Functional
/// 1. Initalizes the video player controller
/// 2. Play the video.
/// 3. Hardware button
///   - Play/Pause button
///   - Play button
///   - Pause button
///   - Select button
///   - Back button
///   - Forward/Rewind button
///   - Left/Right arrow button to seek.
///
/// Display
/// Stack
///   1. Video Player
///   2. Black tint container
///   3. Video controls
///     - Play/Pause button
///     - Progress bar (with remaining time left)
///
/// States
///     Event                 State
///   1. InitVideoEvent    -  VideoPlaying
///   2. PausevideoEvent   -  VideoPaused
///   3. PlayVideoEvent    -  VideoPlaying
///   4. ForwardVideoEvent -  VideoForwarded
///   5. RewindVideoEvent  -  VideoRewinded
///
//////////////////////////////////////////////////////////////////////////////
class VidPlayerScreen extends StatefulWidget {
  final VideoConfig videoConfig;
  const VidPlayerScreen({Key? key, required this.videoConfig})
      : super(key: key);

  _VidPlayerScreenState createState() => _VidPlayerScreenState();
}

class _VidPlayerScreenState extends State<VidPlayerScreen> {
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
            body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => VideoPlayerBloc()..add(InitVideoEvent())),
          ],
          child: VideoPlayerWidget(videoConfig: widget.videoConfig),
        )),
      );
    } catch (e) {
      print("Execption caught - $e");
      return Container(child: Text("Exception caught - $e"));
    }
  }
}
