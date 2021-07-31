import 'dart:ui';

import 'package:adonai_2/constants/theme_info.dart';
import 'package:adonai_2/models/Sermon_config.dart';
import 'package:adonai_2/models/Sermons.dart';
import 'package:adonai_2/models/video_player_config.dart';
import 'package:adonai_2/services/https_network.dart';
import 'package:adonai_2/utils/string_utils.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final Sermon sermon;

  const VideoScreen({Key? key, required this.sermon}) : super(key: key);
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late SermonConfig sermonConfig;

  Widget build(BuildContext context) {
    return Scaffold(
      body: videoPlayerWidget(),
    );
  }

  Widget videoPlayerWidget() {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done &&
            snapShot.hasData) {
          return Stack(
            children: <Widget>[
              _displayHeroImage(context),
              _displayLogo(context),
              _displayMainContent(context),
            ],
          );
        }
        return Center(child: CircularProgressIndicator(color: adonaiRed));
      },
      future: _getSermonConfig(),
    );
  }

  Future _getSermonConfig() async {
    sermonConfig =
        await DataService().getSermonConfig(getVidIdFromUrl(widget.sermon.url));
    return sermonConfig;
  }

  Widget _displayHeroImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.sermon.thumbnails[4].url),
            fit: BoxFit.fitWidth),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5))),
      ),
    );
  }

  Widget _displayLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
      child: Image.asset(
        "images/White_logo_with_BG.png",
        height: MediaQuery.of(context).size.height * .15,
      ),
    );
  }

  Widget _displayMainContent(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _displaySermonDetails(context),
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
            ),
            _displayMore(context)
          ],
        ),
      ),
    );
  }

  Widget _displayTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .25,
      child: AutoSizeText(
        widget.sermon.title,
        style: TextStyle(color: Colors.white, fontSize: 30),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _displayDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
      child: AutoSizeText(
        widget.sermon.description,
        style: TextStyle(color: Colors.white, fontSize: 15),
        maxFontSize: 20,
      ),
    );
  }

  Widget _displaySermonDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _displayTitle(context),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _displayDescription(context),
              _displayButton(context),
            ],
          ),
          _displayThumbnail(context),
        ],
      ),
    );
  }

  Widget _displayThumbnail(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .55,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: widget.sermon.thumbnails[4].url,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(color: Colors.red)),
          )
          // child: Image.network(
          //   widget.sermon.thumbnails[4].url,
          // )
          ),
    );
  }

  Widget _displayButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonHandler(
              onPress: () => Navigator.of(context).pushNamed(
                  "/videoPlayerScreen",
                  arguments: new VideoConfig(
                      url:
                          sermonConfig.request.files.hls.cdns.fastlySkyfire.url,
                      isLive: false)),
              text: "PLAY"),
          SizedBox(width: MediaQuery.of(context).size.width * .02),
          ButtonHandler(onPress: () {}, text: "SAVE FOR LATER"),
        ],
      ),
    );
  }

  Widget _displayMore(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
      child: Column(children: <Widget>[
        Stack(children: <Widget>[
          Text(
            "MORE LIKE THIS",
            style: TextStyle(color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .15,
              right: MediaQuery.of(context).size.width * .03,
            ),
            child: Divider(
              thickness: 2,
              color: Colors.white,
            ),
          )
        ])
      ]),
    );
  }
}

class ButtonHandler extends StatefulWidget {
  // final double width;
  // final double height;
  final String text;
  final Function() onPress;

  const ButtonHandler(
      {Key? key,
      // required this.width,
      // required this.height,
      required this.onPress,
      required this.text})
      : super(key: key);

  _ButtonHandlerState createState() => _ButtonHandlerState();
}

class _ButtonHandlerState extends State<ButtonHandler> {
  var _focus = FocusNode();
  bool _isFocused = false;

  void _onFocusChange() {
    setState(() {
      _isFocused = (_focus.hasFocus) ? true : false;
    });
  }

  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  Widget build(BuildContext context) {
    return TextButton(
        focusNode: _focus,
        style: TextButton.styleFrom(
          backgroundColor: (_isFocused) ? Colors.black54 : Colors.white,
        ),
        onPressed: widget.onPress,
        child: Text(
          widget.text,
          style: TextStyle(color: (_isFocused) ? Colors.white : Colors.black),
        ));
  }
}
