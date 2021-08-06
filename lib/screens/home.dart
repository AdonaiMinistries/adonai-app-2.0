import 'package:adonai/bloc/sermons_event.dart';
import 'package:adonai/constants/device_info.dart';
import 'package:adonai/bloc/sermons_bloc.dart';
import 'package:adonai/screens/phone/home_screen.dart';
import 'package:adonai/screens/tv/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => SermonsBloc()..add(GetAppConfigEvent())),
          ],
          child: ("tv" == DeviceDetector.deviceType(MediaQuery.of(context)))
              ? TvHomeScreen()
              : PhoneHomeScreen()),
    );
  }
}
