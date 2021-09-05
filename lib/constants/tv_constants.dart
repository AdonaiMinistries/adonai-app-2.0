import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppNavigationConstants {
  static const String SPLASH_SCREEN = "SplashScreen";
  static const String HOME_SCREEN = "HomeScreen";
  static const String VIDEO_DETAILS_SCREEN = "VideoDetailsScreen";
}

enum SEEK_ACTION { FORWARD, REWIND }
enum VIDEO_STATE { PLAY, PAUSE, FORWARD, REWIND, PLAY_PAUSE }

class VideoPlayerConstants {
  static const int SEEK_BY = 5;
}

class TvDpadConstants {
  isMediaPlayPauseKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.mediaPlayPause) ||
        (event.logicalKey == LogicalKeyboardKey.mediaPlayPause)) {
      return true;
    }
    return false;
  }

  isSelectKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.select) ||
        (event.logicalKey == LogicalKeyboardKey.select)) {
      return true;
    }
    return false;
  }

  isMediaPlayKey(event) {
    if ((event.logicalKey == LogicalKeyboardKey.mediaPlay) ||
        (event.physicalKey == PhysicalKeyboardKey.mediaPlay)) {
      return true;
    }
    return false;
  }

  isMediaPauseKey(event) {
    if ((event.logicalKey == LogicalKeyboardKey.mediaPause) ||
        (event.physicalKey == PhysicalKeyboardKey.mediaPause)) {
      return true;
    }
    return false;
  }

  isForwardKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.mediaFastForward) ||
        ((event.logicalKey == LogicalKeyboardKey.mediaFastForward))) {
      return true;
    }
    return false;
  }

  isRightKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.arrowRight) ||
        ((event.logicalKey == LogicalKeyboardKey.arrowRight))) {
      return true;
    }
    return false;
  }

  isRewindKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.mediaRewind) ||
        ((event.logicalKey == LogicalKeyboardKey.mediaRewind))) {
      return true;
    }
    return false;
  }

  isLeftKey(event) {
    if ((event.physicalKey == PhysicalKeyboardKey.arrowLeft) ||
        ((event.logicalKey == LogicalKeyboardKey.arrowLeft))) {
      return true;
    }
    return false;
  }
}

class LiveRedCircle extends CustomPainter {
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), 05, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
