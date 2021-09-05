import 'dart:io';

import 'package:adonai/bloc/video_player/video_player_event.dart';
import 'package:adonai/bloc/video_player/video_player_state.dart';
import 'package:adonai/constants/tv_constants.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerInitState());

  Stream<VideoPlayerState> mapEventToState(VideoPlayerEvent event) async* {
    try {
      switch (event.runtimeType) {
        case InitVideoEvent:
          yield VideoPlayingState();
          break;

        case PauseVideoEvent:
          await _pauseVideo(event as PauseVideoEvent);
          yield VideoPausedState();
          break;

        case PlayVideoEvent:
          _playVideo(event as PlayVideoEvent);
          yield VideoPlayingState();
          break;

        case PlayPauseVideoEvent:
          _playPauseVideo(event as PlayPauseVideoEvent);

          VideoPlayerController _vidCntrlr =
              ((event).controller as ChewieController).videoPlayerController;

          if (!_vidCntrlr.value.isInitialized) {
            yield VideoPlayingState();
          } else {
            yield ((event).controller as ChewieController).isPlaying
                ? VideoPlayingState()
                : VideoPausedState();
          }
          break;

        case ForwardVideoEvent:
          _seekVideo(event, SEEK_ACTION.FORWARD);
          yield VideoForwardedState();
          break;

        case RewindVideoEvent:
          _seekVideo(event, SEEK_ACTION.REWIND);
          yield VideoRewindedState();
          break;

        case ShowControllerEvent:
          yield ShowControlsState(
              nextState: (event as ShowControllerEvent).nextState);
          break;

        default:
          yield FailedVideoPlayerState(error: "Failed to load video player");
      }
    } catch (e) {
      yield FailedVideoPlayerState(error: e);
    }
  }

  void _seekVideo(event, action) {
    var _controller;
    var _currTime;
    if (action == SEEK_ACTION.FORWARD) {
      _controller =
          ((event as ForwardVideoEvent).controller) as ChewieController;
      _currTime = _controller.videoPlayerController.value.position.inSeconds +
          VideoPlayerConstants.SEEK_BY;
    } else {
      _controller =
          ((event as RewindVideoEvent).controller) as ChewieController;

      _currTime = _controller.videoPlayerController.value.position.inSeconds -
          VideoPlayerConstants.SEEK_BY;
    }
    _controller.seekTo(Duration(seconds: _currTime));
  }

  Future _playVideo(PlayVideoEvent event) async {
    var _controller = event.controller as ChewieController;
    if (!_controller.isPlaying) await _controller.play();
  }

  Future _pauseVideo(PauseVideoEvent event) async {
    var _controller = event.controller as ChewieController;
    if (_controller.isPlaying) await _controller.pause();
  }

  Future _playPauseVideo(PlayPauseVideoEvent event) async {
    var _controller = event.controller as ChewieController;
    _controller.togglePause();
  }
}
