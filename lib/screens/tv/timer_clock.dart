import 'dart:async';

import 'package:adonai_2/constants/theme_info.dart';
import 'package:adonai_2/models/Live_config.dart';
import 'package:adonai_2/models/video_player_config.dart';
import 'package:adonai_2/screens/tv/video_player.dart';
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
  // String url =
  //     "https://skyfire.vimeocdn.com/1627757115-0xf2876e784a9645c0626a0d312532f2429bc4f530/d9a13455-2e4c-4a02-afde-ef4dda419692/sep/video/192f4873,51907f43,55b9af24,b748e73e,fdf8a33f/audio/36e1bb16,e944b5da/master.m3u8?query_string_ranges=1";

  /* Initialise the timer. */
  initState() {
    super.initState();
    _liveTime = DateFormat.yMd().add_jms().parse(widget.liveConfig.time);
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

  _naviagteToVideoPlayer(context) => VideoPlayerScreen(
        videoConfig: new VideoConfig(url: widget.liveConfig.url, isLive: true),
      );
}
