import 'package:adonai/bloc/sermons/sermons_bloc.dart';
import 'package:adonai/bloc/sermons/sermons_event.dart';
import 'package:adonai/screens/tv/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return WillPopScope(
        onWillPop: () async {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        },
        child: Scaffold(
            body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => SermonsBloc()..add(GetAppConfigEvent())),
          ],
          child: TvHomeScreen(),
        )),
      );
    } catch (e) {
      return Container(child: Text("Exception occured - $e"));
    }
  }
}
