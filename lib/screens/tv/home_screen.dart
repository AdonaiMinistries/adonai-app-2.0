import 'package:adonai/bloc/sermons/sermons_bloc.dart';
import 'package:adonai/bloc/sermons/sermons_event.dart';
import 'package:adonai/bloc/sermons/sermons_state.dart';
import 'package:adonai/models/Live_config.dart';
import 'package:adonai/widgets/tv/home_screen_contents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvHomeScreen extends StatefulWidget {
  const TvHomeScreen({Key? key}) : super(key: key);

  @override
  _TvHomeScreenState createState() => _TvHomeScreenState();
}

class _TvHomeScreenState extends State<TvHomeScreen> {
  var _liveConfig;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<SermonsBloc, SermonsState>(builder: (context, state) {
        switch (state.runtimeType) {
          case FetchingAppConfigState:
          case FetchingSermonsState:
            return Center(child: CircularProgressIndicator(color: Colors.red));

          case FetchedAppConfigState:
            /* App config is fetched now fetch sermons list.*/
            BlocProvider.of<SermonsBloc>(context).add(FetchSermonsEvent(
                token:
                    (state as FetchedAppConfigState).appConfig.config.token));
            _liveConfig = LiveConfig(
                time: state.appConfig.config.stream.nextStream,
                url: state.appConfig.config.stream.link);
            return CircularProgressIndicator(color: Colors.red);

          case FailedToFetchState:
            return Container(
                child: Center(
                    child:
                        Text((state as FailedToFetchState).error as String)));

          default:
            return HomeScreenContent(
              sermons: (state as FetchedSermonsState).sermons,
              liveConfig: _liveConfig,
            );
        }
      }),
    );
  }
}
