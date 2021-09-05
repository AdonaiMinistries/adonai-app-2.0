import 'package:adonai/constants/theme_info.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OverLayVideoControls extends StatefulWidget {
  final String title;
  final VideoPlayerController controller;
  const OverLayVideoControls(
      {Key? key, required this.controller, required this.title})
      : super(key: key);

  @override
  _OverLayVideoControlsState createState() => _OverLayVideoControlsState();
}

class _OverLayVideoControlsState extends State<OverLayVideoControls> {
  var _focus = FocusNode();

  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focus,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          child: Stack(
            children: [buildPlay(), _buildVideoProgress(context), buildTitle()],
          )),
    );
  }

  void initState() {
    super.initState();
    _focus.addListener(() {});
  }

  void dispose() {
    super.dispose();
    _focus.dispose();
  }

////////////////////////////////////////////////////////////////////////
  /// This api gets the current position of video
////////////////////////////////////////////////////////////////////////
  String getPosition() {
    final duration = Duration(
        milliseconds: widget.controller.value.position.inMilliseconds.round());

    setState(() {});

    return _getTimeString(duration);
  }

////////////////////////////////////////////////////////////////////////
  /// This api gets the total time of video
////////////////////////////////////////////////////////////////////////
  String getTotalTime() {
    final duration = Duration(
        milliseconds: widget.controller.value.duration.inMilliseconds.round());

    setState(() {});

    return _getTimeString(duration);
  }

////////////////////////////////////////////////////////////////////////
  /// Converts the time to string format
////////////////////////////////////////////////////////////////////////
  String _getTimeString(Duration duration) {
    if (duration.inHours > 0) {
      return [duration.inHours, duration.inMinutes, duration.inSeconds]
          .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
          .join(':');
    }

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  _buildProgessIndicator() => Container(
      child: VideoProgressIndicator(widget.controller, allowScrubbing: true));

  _getTimeStamp() => Text(getPosition() + '/' + getTotalTime(),
      style: VideoPlayerThemeData.timeStampTextTheme());

////////////////////////////////////////////////////////////////////////
  /// This api builds the video progress bar on the bottom of the screen
////////////////////////////////////////////////////////////////////////
  _buildVideoProgress(context) => Padding(
        padding: const EdgeInsets.all(8.0).copyWith(
            top: MediaQuery.of(context).size.width * .50,
            left: MediaQuery.of(context).size.width * .02,
            right: MediaQuery.of(context).size.width * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTimeStamp(),
            SizedBox(height: MediaQuery.of(context).size.width * .01),
            _buildProgessIndicator()
          ],
        ),
      );

////////////////////////////////////////////////////////////////////////
  /// The visible play button is builded here
  /// This will be displayed only when the video is in paused state.
////////////////////////////////////////////////////////////////////////
  Widget buildPlay() => AnimatedSwitcher(
        duration: Duration(milliseconds: 50),
        reverseDuration: Duration(milliseconds: 200),
        child: widget.controller.value.isPlaying
            ? Container()
            : Container(
                color: Colors.black45,
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
      );

////////////////////////////////////////////////////////////////////////
  /// The video title shown when video is paused is built by below api.
////////////////////////////////////////////////////////////////////////
  Widget buildTitle() => Positioned(
        top: MediaQuery.of(context).size.height * .05,
        left: MediaQuery.of(context).size.width * .02,
        child: Container(
          width: MediaQuery.of(context).size.width * .50,
          child: widget.controller.value.isPlaying
              ? Container()
              : AutoSizeText(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.start,
                ),
        ),
      );
}
