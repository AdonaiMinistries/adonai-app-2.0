import 'dart:ui';

import 'package:adonai_2/bloc/sermons_state.dart';
import 'package:adonai_2/constants/theme_info.dart';
import 'package:adonai_2/models/Live_config.dart';
import 'package:adonai_2/models/video_player_config.dart';
import 'package:adonai_2/screens/tv/sermons_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  final LoadedSermonsState state;
  final LiveConfig liveConfig;

  const HomeScreenContent(
      {Key? key, required this.state, required this.liveConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _displayLogo(context),
        _displayLiveAndSermon(context),
        _displaySermonsList(context)
      ],
    );
  }

  Widget _displayLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * .01),
      child: Image.asset(
        "images/White_logo_with_BG.png",
        height: MediaQuery.of(context).size.height * .15,
      ),
    );
  }

  Widget _displayLiveAndSermon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .30,
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          LiveButton(liveConfig: liveConfig),
          _displayTextSermon(context)
        ]),
      ),
    );
  }

  Widget _displayTextSermon(BuildContext context) {
    return Stack(children: <Widget>[
      Text(
        "SERMONS",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .02,
            left: MediaQuery.of(context).size.width * .12),
        child: Divider(thickness: 2, color: Colors.white),
      )
    ]);
  }

  Widget _displaySermonsList(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05),
      child: SermonsList(sermons: state.sermons),
    ));
  }
}

class LiveButton extends StatefulWidget {
  final LiveConfig liveConfig;

  const LiveButton({Key? key, required this.liveConfig}) : super(key: key);
  @override
  _LiveButtonState createState() => _LiveButtonState();
}

class _LiveButtonState extends State<LiveButton> {
  var _focus = FocusNode();
  var _buttonColor = liveButtonColor;
  var _textColor = Colors.white;

  void _onFocusChange() {
    setState(() {
      _buttonColor = (_focus.hasFocus) ? Colors.white : liveButtonColor;
      _textColor = (_focus.hasFocus) ? Colors.red : (Colors.white);
    });
  }

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      focusNode: _focus,
      onPressed: () => Navigator.of(context).pushNamed("/videoPlayerScreen",
          arguments: new VideoConfig(url: widget.liveConfig.url, isLive: true)),
      // onPressed: () => Navigator.of(context)
      //     .pushNamed("/timerClockScreen", arguments: widget.liveConfig),
      child: Text(
        "LIVE",
        style: TextStyle(color: _textColor),
      ),
      style: TextButton.styleFrom(
          backgroundColor: _buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          fixedSize: Size(100, 20)),
    );
  }
}
