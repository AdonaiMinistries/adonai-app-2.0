import 'dart:ui';

import 'package:adonai_2/bloc/sermons_state.dart';
import 'package:adonai_2/constants/theme_info.dart';
import 'package:adonai_2/bloc/sermons_bloc.dart';
import 'package:adonai_2/screens/tv/home_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvHomeScreen extends StatefulWidget {
  @override
  _TvHomeScreenState createState() => _TvHomeScreenState();
}

class _TvHomeScreenState extends State<TvHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: BlocBuilder<SermonsBloc, SermonsState>(builder: (context, state) {
        if (state is LoadingSermonsState) {
          return Center(
              child: CircularProgressIndicator(
            color: adonaiRed,
          ));
        } else if (state is LoadedSermonsState) {
          return Stack(
            children: <Widget>[
              _displayHeroImage(context),
              HomeScreenContent(state: state,),
            ],
          );
        } else {
          return Center(
              child: Text("Failed to fetch data.", style: TextStyle(color: Colors.white),)
              );
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
}
