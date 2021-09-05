import 'package:adonai/models/Live_config.dart';
import 'package:adonai/models/Sermons.dart';
import 'package:adonai/widgets/tv/Sermon_tile.dart';
import 'package:adonai/widgets/tv/live_button.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatelessWidget {
  final List<Sermon> sermons;
  final LiveConfig liveConfig;

  const HomeScreenContent(
      {Key? key, required this.sermons, required this.liveConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _displayBackground(context),
        _displayLogo(context),
        LiveButton(liveConfig: liveConfig),
        _displaySermonsText(context),
        _displaySermonGridView(context),
      ],
    );
  }

  _displayBackground(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/tv_background.png'),
              fit: BoxFit.fitWidth),
        ),
        child: Container());
  }

  _displayLogo(context) => Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.height * .01),
        child: Image.asset(
          "images/White_logo_with_BG.png",
          height: MediaQuery.of(context).size.height * .15,
        ),
      );

  _displaySermonsText(context) => Center(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .09,
              left: MediaQuery.of(context).size.width * .05,
              right: MediaQuery.of(context).size.width * .05),
          child: Stack(children: <Widget>[
            Text(
              "SERMONS",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .02,
                  left: MediaQuery.of(context).size.width * .12),
              child: Divider(thickness: 2, color: Colors.white),
            )
          ]),
        ),
      );

  _displaySermonGridView(context) => Center(
          child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .58,
          left: MediaQuery.of(context).size.width * .04,
          right: MediaQuery.of(context).size.width * .04,
        ),
        child: SermonsListView(sermons: sermons),
      ));
}
