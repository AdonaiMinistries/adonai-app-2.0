import 'dart:async';
import 'package:adonai/app_navigator.dart';
import 'package:adonai/widgets/tv/Loading_widget.dart';
import 'package:flutter/material.dart';

class TvSplashScreen extends StatelessWidget {
  const TvSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoadingWidget());
  }
}

class SplashScreenTv extends StatefulWidget {
  const SplashScreenTv({Key? key}) : super(key: key);

  @override
  _SplashScreenTvState createState() => _SplashScreenTvState();
}

class _SplashScreenTvState extends State<SplashScreenTv> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(RouteList.HOME);
    });
  }

  Widget build(BuildContext context) {
    return LoadingWidget();
  }
}
