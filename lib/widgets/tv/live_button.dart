import 'package:adonai/app_navigator.dart';
import 'package:adonai/constants/theme_info.dart';
import 'package:adonai/models/Live_config.dart';
import 'package:flutter/material.dart';

class LiveButton extends StatefulWidget {
  final LiveConfig liveConfig;
  const LiveButton({Key? key, required this.liveConfig}) : super(key: key);

  _LiveButtonState createState() => _LiveButtonState();
}

class _LiveButtonState extends State<LiveButton> {
  var _focus = FocusNode();
  var _buttonColor = LiveButtonThemeData.defaultColor;
  var _textColor = LiveButtonThemeData.defaultTextColor;

  void _onFocusChange() {
    setState(() {
      _buttonColor = (_focus.hasFocus)
          ? LiveButtonThemeData.focusColor
          : LiveButtonThemeData.defaultColor;
      _textColor = (_focus.hasFocus)
          ? LiveButtonThemeData.focusTextColor
          : LiveButtonThemeData.defaultTextColor;
    });
  }

  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        focusNode: _focus,
        onPressed: () => Navigator.of(context)
            .pushNamed(RouteList.TIMER_SCREEN, arguments: widget.liveConfig),
        child: Text(
          "LIVE",
          style: TextStyle(color: _textColor),
        ),
        style: TextButton.styleFrom(
            backgroundColor: _buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            fixedSize: Size(100, 20)),
      ),
    );
  }
}
