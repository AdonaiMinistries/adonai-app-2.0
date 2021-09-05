import 'dart:async';

import 'package:adonai/bloc/video_player/video_player_bloc.dart';
import 'package:adonai/bloc/video_player/video_player_event.dart';
import 'package:adonai/bloc/video_player/video_player_state.dart';
import 'package:adonai/constants/tv_constants.dart';
import 'package:adonai/models/video_player_config.dart';
import 'package:adonai/widgets/tv/video_player/video_player_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoConfig videoConfig;
  const VideoPlayerWidget({Key? key, required this.videoConfig})
      : super(key: key);

  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

// Initalize video player controller
//

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late var _chewieController;
  var _focus = FocusNode();
  late Widget _player = Container();
  late Widget _controls = Container();
  var _timer;

  void initState() {
    super.initState();
    _focus.addListener(() {});
    _focus.requestFocus();
    _initializeVideoController();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
    _focus.dispose();
    _timer?.cancel();
  }

  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focus,
      onKey: _keyHandler,
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
          builder: (context, state) {
        switch (state.runtimeType) {
          case VideoPlayerInitState:
            /*
              - Show controls
              - Do the initialization 
            */
            BlocProvider.of<VideoPlayerBloc>(context)
                .add(ShowControllerEvent(nextState: VIDEO_STATE.PLAY));
            _player =
                Center(child: CircularProgressIndicator(color: Colors.red));
            break;

          case VideoPlayingState:
            /*
              - Start playing the video.
              - Hide the controller
            */
            _player = VideoPlayer(_controller);
            _controls = _videoControls(false);
            break;

          case VideoPausedState:
            _player = VideoPlayer(_controller);
            _controls = _videoControls(true);
            break;

          case VideoForwardedState:
          case VideoRewindedState:
            _player = VideoPlayer(_controller);
            _autoHideControls();
            // _controls = OverLayVideoControls(controller: _controller);
            break;

          case ShowControlsState:
            /*
              - Show controls
              - Call the next event present in state data
            */
            _controls = _videoControls(true);
            _processNextState((state as ShowControlsState), context);
            break;

          case HideControlsState:
            _controls = Container();
            break;

          default:
            _player =
                Center(child: CircularProgressIndicator(color: Colors.blue));
            _controls = _videoControls(false);
            break;
        }

        return Stack(
          // children: [_player, Positioned.fill(child: _controls)],
          children: [_player, _controls],
        );
      }),
    );
  }

  _videoControls(show) {
    if (widget.videoConfig.isLive) {
      return buildLiveText();
    }
    if (show) {
      return Positioned.fill(
        child: OverLayVideoControls(
            controller: _controller, title: widget.videoConfig.title),
      );
    } else {
      return Container();
    }
  }

///////////////////////////////////////////////////////////////////////////////
  /// Before changing the state of video (i.e. play, pause, seek)
  /// Need to show controls
  /// Then process to the state in which video actually needs to be.
///////////////////////////////////////////////////////////////////////////////
  _processNextState(ShowControlsState state, BuildContext context) {
    if ((state).nextState == VIDEO_STATE.PLAY) {
      BlocProvider.of<VideoPlayerBloc>(context)
          .add(PlayVideoEvent(controller: _chewieController));
    } else if (state.nextState == VIDEO_STATE.PAUSE) {
      BlocProvider.of<VideoPlayerBloc>(context)
          .add(PauseVideoEvent(controller: _chewieController));
    } else if (state.nextState == VIDEO_STATE.PLAY_PAUSE) {
      BlocProvider.of<VideoPlayerBloc>(context)
          .add(PlayPauseVideoEvent(controller: _chewieController));
    } else if (state.nextState == VIDEO_STATE.FORWARD) {
      BlocProvider.of<VideoPlayerBloc>(context)
          .add(ForwardVideoEvent(controller: _chewieController));
    } else if (state.nextState == VIDEO_STATE.REWIND) {
      BlocProvider.of<VideoPlayerBloc>(context)
          .add(RewindVideoEvent(controller: _chewieController));
    }
  }

///////////////////////////////////////////////////////////////////////////////
  /// - In order to show video progress bar during the seeking while video
  ///   is in playing state
  /// - Start a timer of 3 seconds only if video is in playing state
///////////////////////////////////////////////////////////////////////////////
  void _autoHideControls() {
    if ((_controller.value.isPlaying)) {
      _timer = Timer.periodic(Duration(seconds: 3), (timer) {
        _controls = AnimatedContainer(
          duration: Duration(seconds: 2),
        );
        timer.cancel();
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

///////////////////////////////////////////////////////////////////////////////
  /// - On key press, need to show controls first
  /// - Set the state in which video should be in ShowControllerEvent class.
///////////////////////////////////////////////////////////////////////////////
  _keyHandler(event) {
    if (widget.videoConfig.isLive) {
      /* For live video, cannot use video controls */
      return;
    }
    if (event.runtimeType == RawKeyUpEvent) {
      if (TvDpadConstants().isMediaPlayKey(event)) {
        BlocProvider.of<VideoPlayerBloc>(context)
            .add(ShowControllerEvent(nextState: VIDEO_STATE.PLAY));
      } else if (TvDpadConstants().isMediaPauseKey(event)) {
        BlocProvider.of<VideoPlayerBloc>(context)
            .add(ShowControllerEvent(nextState: VIDEO_STATE.PAUSE));
      } else if ((TvDpadConstants().isMediaPlayPauseKey(event)) ||
          (TvDpadConstants().isSelectKey(event))) {
        BlocProvider.of<VideoPlayerBloc>(context)
            .add(ShowControllerEvent(nextState: VIDEO_STATE.PLAY_PAUSE));
      } else if (TvDpadConstants().isForwardKey(event) ||
          TvDpadConstants().isRightKey(event)) {
        BlocProvider.of<VideoPlayerBloc>(context)
            .add(ShowControllerEvent(nextState: VIDEO_STATE.FORWARD));
      } else if (TvDpadConstants().isRewindKey(event) ||
          TvDpadConstants().isLeftKey(event)) {
        BlocProvider.of<VideoPlayerBloc>(context)
            .add(ShowControllerEvent(nextState: VIDEO_STATE.REWIND));
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////
  /// Initalize the video player
  /// Video should start as soon as it is initialized.
  /// Video should play in full-screen mode by default.
///////////////////////////////////////////////////////////////////////////////
  _initializeVideoController() {
    _controller = VideoPlayerController.network(widget.videoConfig.url);
    try {
      return _chewieController = ChewieController(
        videoPlayerController: _controller,
        fullScreenByDefault: true,
        autoInitialize: true,
        aspectRatio: 16 / 9,
        autoPlay: true,
        showOptions: false,
        allowedScreenSleep: false,
        showControls: false,
      );
    } catch (e) {
      print("Error in initialization of video player $e");
      throw e;
    }
  }

////////////////////////////////////////////////////////////////////////
  /// This widget will build the live text on the screen
////////////////////////////////////////////////////////////////////////
  Widget buildLiveText() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: CustomPaint(
              painter: LiveRedCircle(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .01,
          ),
          Text(
            "LIVE",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
