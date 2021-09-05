import 'dart:async';

import 'package:adonai/app_navigator.dart';
import 'package:adonai/constants/theme_info.dart';
import 'package:adonai/models/Live_config.dart';
import 'package:adonai/models/video_player_config.dart';
import 'package:adonai/screens/tv/video_player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerClockScreen extends StatefulWidget {
  final LiveConfig liveConfig;
  const TimerClockScreen({Key? key, required this.liveConfig})
      : super(key: key);

  _TimerClockScreenState createState() => _TimerClockScreenState();
}

class _TimerClockScreenState extends State<TimerClockScreen> {
  late String _timeDiff;
  late DateTime _liveTime;
  late bool _timeout = false;
  late var _timer;

  /* Initialise the timer. */
  initState() {
    super.initState();
    if (widget.liveConfig.time != "") {
      _liveTime = DateFormat.yMd().add_jms().parse(widget.liveConfig.time);
    } else {
      _liveTime = DateTime.now();
    }
    _getTimeDifference(null, _liveTime);
    _timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => _getTimeDifference(t, _liveTime));
  }

  dispose() {
    super.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: (!_timeout)
          ? Center(child: _displayTime(context))
          : _naviagteToVideoPlayer(context),
    );
  }

  _getTimeDifference(t, liveTime) {
    var _currTime = DateTime.now();
    print(DateFormat.yMd().add_jms().format(_currTime));

    var _days = liveTime.difference(_currTime).inDays;
    var _sec = (liveTime.difference(_currTime).inSeconds).round();

    setState(() {
      if ((_days == 0 && _sec == 0) ||
          ((_days.isNegative) || (_sec.isNegative))) {
        if (t != null) {
          /* Stop the timer. */
          t.cancel();
          _timeout = true;
        }
      }
      var _timeStr = (Duration(seconds: _sec)).toString().split(":");
      _timeDiff =
          "Day(s) - $_days Hours - ${_timeStr[0]} Minutes - ${_timeStr[1]} "
          "Seconds - ${(_timeStr[2].split("."))[0]}";
    });
  }

  _displayTime(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Next Service",
            style: VideoPlayerThemeData.textTheme(Colors.grey.shade700)),
        SizedBox(height: MediaQuery.of(context).size.height * .03),
        Text("${DateFormat.yMMMMEEEEd().add_jms().format(_liveTime)}",
            style: VideoPlayerThemeData.textTheme(Colors.white)),
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        Text(_timeDiff,
            style: VideoPlayerThemeData.textTheme(Colors.red.shade800)),
      ],
    );
  }

  _naviagteToVideoPlayer(context) {
    return VidPlayerScreen(
        videoConfig: VideoConfig(
      title: "",
      isLive: true,
      url: widget.liveConfig.url,
    ));
  }
}
