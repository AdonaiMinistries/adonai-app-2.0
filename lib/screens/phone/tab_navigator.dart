import 'package:adonai/screens/phone/connect/adonaibuildingproject.dart';
import 'package:adonai/screens/phone/connect/cellgroups.dart';
import 'package:adonai/screens/phone/connect/connect.dart';
import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
import 'package:adonai/screens/phone/connect/tinystars.dart';
import 'package:flutter/material.dart';
import 'package:adonai/screens/phone/navigationbar.dart';
//import 'package:persistent_bottom/bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {

    Widget child=ConnectPage() ;
    // if(tabItem == "ConnectPage")
    //   child = ConnectPage();
    // else if(tabItem == "DaughtersOfZion")
    //   child = DaughtersOfZion();
    // else if(tabItem == "TinyStars")
    //   child = TinyStars();
     if(tabItem == "ConnectPage")
      child =ConnectPage();
    else if(tabItem == "DaughtersOfZion")
      child = AdonaiBuildingProject();
    else if(tabItem == "TinyStars")
      child = AdonaiBuildingProject();
    else if(tabItem=="AdonaiBuildingProject")
    child=AdonaiBuildingProject();
    else if(tabItem=="CellGroup")
    child=CellGroup();
    
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
          );
      },
    );
  }
}