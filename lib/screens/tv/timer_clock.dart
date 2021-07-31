import 'dart:async';

import 'package:adonai_2/models/Live_config.dart';
import 'package:adonai_2/models/video_player_config.dart';
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

  /* Initialise the timer. */
  initState() {
    super.initState();
    _liveTime = DateFormat.yMd().add_jms().parse(widget.liveConfig.time);
    _getTimeDifference(_liveTime);
    Timer.periodic(
        Duration(seconds: 1), (Timer t) => _getTimeDifference(_liveTime));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next Service"),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            Text("${DateFormat.yMMMMEEEEd().add_jms().format(_liveTime)}"),
            SizedBox(height: MediaQuery.of(context).size.height * .05),
            Text(_timeDiff, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  _getTimeDifference(liveTime) {
    var _currTime = DateTime.now();

    var _days = liveTime.difference(_currTime).inDays;
    var _sec = (liveTime.difference(_currTime).inSeconds).round();

    if ((_days == 0 && _sec == 0) ||
        ((_days.isNegative) || (_sec.isNegative))) {
      setState(() => Navigator.of(context).pushNamed("/videoPlayerScreen",
          arguments:
              new VideoConfig(url: widget.liveConfig.url, isLive: true)));
    }

    setState(() {
      var _timeStr = (Duration(seconds: _sec)).toString().split(":");
      _timeDiff =
          "Day(s) - $_days Hours - ${_timeStr[0]} Minutes - ${_timeStr[1]} Seconds - ${(_timeStr[2].split("."))[0]}";
    });
  }

  // String _formatDateTime(DateTime dateTime) {
  //   // return DateFormat.yMMMMd().format(dateTime);
  //   print(DateFormat.yMd().add_jms().format(dateTime));
  //   return DateFormat.yMMMMEEEEd().add_jms().format(dateTime);
  // }

  // _parseTime(timeNow) {
  //   String _time = "Monday, August 2, 2021 3:00:00 AM";

  //   var _futureTime = DateFormat.yMMMMEEEEd().add_jms().parse(_time);
  //   var _days = _futureTime.difference(timeNow).inDays;
  //   var _hours = (_futureTime.difference(timeNow).inHours).round();
  //   var _inmin = (_futureTime.difference(timeNow).inMinutes).round();

  //   _inmin = ((_inmin > 60) ? (_inmin / 1440) : (_inmin)).toInt();
  //   print("Days - $_days, Hours - $_hours, Minutes - $_inmin");
  // }

  // void _getTime(t) {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime = _formatDateTime(now);
  //   setState(() {
  //     _timeDiff = formattedDateTime;
  //   });
  // }
}
