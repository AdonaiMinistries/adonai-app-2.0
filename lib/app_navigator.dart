import 'package:adonai/models/Live_config.dart';
import 'package:adonai/models/Sermons.dart';
import 'package:adonai/models/video_player_config.dart';
import 'package:adonai/screens/home.dart';
import 'package:adonai/screens/tv/home_screen.dart';
import 'package:adonai/screens/tv/splash_screen.dart';
import 'package:adonai/screens/tv/timer_clock.dart';
import 'package:adonai/screens/tv/video_player.dart';
import 'package:adonai/screens/tv/video_screen.dart';
import 'package:flutter/material.dart';

class RouteList {
  static const String SPLASH_SCREEN = '/';
  static const String HOME = '/home';
  static const String HOME_SCREEN = '/homeScreen';
  static const String VIDEO_DETAILS_SCREEN = '/VideoDetailsScreen';
  static const String VIDEO_PLAYER_SCREEN = '/VideoPlayerScreen';
  static const String TIMER_SCREEN = '/TimeScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.SPLASH_SCREEN:
        return MaterialPageRoute(builder: (context) => SplashScreenTv());

      case RouteList.HOME:
        return MaterialPageRoute(builder: (context) => Home());

      case RouteList.HOME_SCREEN:
        return MaterialPageRoute(builder: (context) => TvHomeScreen());

      case RouteList.VIDEO_DETAILS_SCREEN:
        return MaterialPageRoute(
            builder: (context) =>
                VideoScreen(sermon: settings.arguments as Sermon));

      case RouteList.VIDEO_PLAYER_SCREEN:
        return MaterialPageRoute(
            builder: (context) => VidPlayerScreen(
                videoConfig: settings.arguments as VideoConfig));

      case RouteList.TIMER_SCREEN:
        return MaterialPageRoute(
            builder: (context) =>
                TimerClockScreen(liveConfig: settings.arguments as LiveConfig));

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  });
}
