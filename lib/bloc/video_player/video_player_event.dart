import 'package:adonai/constants/tv_constants.dart';

///
/// List of Video Player events.
///
///   1. InitVideoEvent    -
///   2. PausevideoEvent   -
///   3. PlayVideoEvent    -
///   4. ForwardVideoEvent -
///   5. RewindVideoEvent  -
abstract class VideoPlayerEvent {}

class InitVideoEvent extends VideoPlayerEvent {}

class PauseVideoEvent extends VideoPlayerEvent {
  final Object controller;

  PauseVideoEvent({required this.controller});
}

class PlayVideoEvent extends VideoPlayerEvent {
  final Object controller;

  PlayVideoEvent({required this.controller});
}

class PlayPauseVideoEvent extends VideoPlayerEvent {
  final Object controller;

  PlayPauseVideoEvent({required this.controller});
}

class ForwardVideoEvent extends VideoPlayerEvent {
  final Object controller;

  ForwardVideoEvent({required this.controller});
}

class RewindVideoEvent extends VideoPlayerEvent {
  final Object controller;

  RewindVideoEvent({required this.controller});
}

class ShowControllerEvent extends VideoPlayerEvent {
  final VIDEO_STATE nextState;

  ShowControllerEvent({required this.nextState});
}

class HideControllerEvent extends VideoPlayerEvent {}
