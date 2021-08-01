import 'package:flutter/material.dart';

const Color adonaiAmber = Color.fromARGB(255, 191, 128, 16);
const Color adonaiSlateGray = Color.fromARGB(255, 31, 93, 108);
const Color adonaiTan = Color.fromARGB(255, 194, 179, 158);
const Color adonaiBlack = Color.fromARGB(255, 12, 12, 12);
const Color adonaiGrey = Color.fromARGB(255, 234, 234, 234);
const Color adonaiRed = Color.fromARGB(255, 219, 69, 81);
const Color titleColor = Color.fromRGBO(112, 112, 112, 1);
const Color liveButtonColor = Color.fromRGBO(248, 86, 86, 1);

ThemeData adonaiTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryTextTheme: _adonaiTextTheme(base.textTheme),
      appBarTheme: _adonaiAppBarTheme(base.appBarTheme),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

TextTheme _adonaiTextTheme(TextTheme base) {
  return base
      .copyWith(
          button: base.button!.copyWith(fontFamily: 'Gotham').apply(
                fontFamily: 'Gotham',
              ),
          bodyText1: base.button!.copyWith(fontFamily: 'Gotham').apply(
                fontFamily: 'Gotham',
              ),
          bodyText2: base.button!.copyWith(fontFamily: 'Gotham').apply(
                fontFamily: 'Gotham',
              ),
          headline6: base.headline6!.copyWith(fontSize: 30))
      .apply(
        fontFamily: 'Gotham',
        displayColor: titleColor,
        bodyColor: titleColor,
      );
}

AppBarTheme _adonaiAppBarTheme(AppBarTheme base) {
  return base.copyWith(backgroundColor: Colors.transparent, elevation: 0);
}

TextStyle navBarIconUnselectedLabelStyle() {
  return TextStyle(color: titleColor, fontSize: 10);
}

TextStyle navBarIconSelectedLabelStyle() =>
    TextStyle(color: adonaiRed, fontSize: 10);

IconThemeData navBarIconSelectedTheme() => IconThemeData(color: adonaiRed);

ThemeData adonaiTvTheme() {
  return adonaiTheme();
}

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///
/// Video Player Theme Data
///
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class VideoPlayerThemeData {
  static textTheme(color) =>
      TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 30);
}
