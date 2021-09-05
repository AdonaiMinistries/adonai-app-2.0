import 'package:adonai/constants/tv_constants.dart';

///
/// List of Video Player state.
///
///   VideoPlaying
///   VideoPaused
///   VideoForwarded
///   VideoRewinded

abstract class VideoPlayerState {}

class VideoPlayerInitState extends VideoPlayerState {}

class VideoPlayingState extends VideoPlayerState {}

class VideoPausedState extends VideoPlayerState {}

class VideoForwardedState extends VideoPlayerState {}

class VideoRewindedState extends VideoPlayerState {}

class ShowControlsState extends VideoPlayerState {
  final VIDEO_STATE nextState;

  ShowControlsState({required this.nextState});
}

class HideControlsState extends VideoPlayerState {}

class FailedVideoPlayerState extends VideoPlayerState {
  Object error;

  FailedVideoPlayerState({required this.error});
}
