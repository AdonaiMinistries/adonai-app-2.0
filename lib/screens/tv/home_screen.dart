import 'dart:ui';

import 'package:adonai_2/bloc/sermons_state.dart';
import 'package:adonai_2/bloc/sermons_bloc.dart';
import 'package:adonai_2/models/Live_config.dart';
import 'package:adonai_2/screens/tv/home_screen_content.dart';
import 'package:adonai_2/widgets/tv/Loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvHomeScreen extends StatefulWidget {
  @override
  _TvHomeScreenState createState() => _TvHomeScreenState();
}

class _TvHomeScreenState extends State<TvHomeScreen> {
  late var _liveConfig;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<SermonsBloc, SermonsState>(builder: (context, state) {
        if ((state is LoadingAppConfigState) ||
            (state is LoadingSermonsState)) {
          return _loadingWidget();
        } else if ((state is LoadedSermonsState)) {
          return _loadConent(state);
        } else if (state is LoadedAppConfigState) {
          return _getAppConfig(state);
        } else {
          return _errorWidget();
        }
      }),
    );
  }

  Widget _displayHeroImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/tv_background.png'),
            fit: BoxFit.fitWidth),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(00))),
      ),
    );
  }

  Widget _loadingWidget() {
    // return LoadingWidget();
    return CircularProgressIndicator(
      color: Colors.red,
    );
  }

  Widget _loadConent(LoadedSermonsState state) {
    return Stack(
      children: <Widget>[
        _displayHeroImage(context),
        HomeScreenContent(
          state: state,
          liveConfig: _liveConfig,
        ),
      ],
    );
  }

  Widget _getAppConfig(LoadedAppConfigState state) {
    _liveConfig = LiveConfig(
        url: state.appConfig.config.stream.link,
        time: state.appConfig.config.stream.nextStream);
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  Widget _errorWidget() {
    return Center(
        child: Text(
      "Failed to fetch data.",
      style: TextStyle(color: Colors.white),
    ));
  }
}
