import 'package:adonai/screens/phone/connect/adonaibuildingproject.dart';
import 'package:adonai/screens/phone/connect/cellgroups.dart';
import 'package:adonai/screens/phone/connect/connect.dart';
import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
import 'package:adonai/screens/phone/connect/tinystars.dart';
import 'package:adonai/screens/phone/tab_navigator.dart';
import 'package:flutter/material.dart';

class NavigationBarMain extends StatefulWidget {
  const NavigationBarMain({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarMain> {
  int _selectedIndex = 0;
  String _currentPage = "ConnectPage";
  List <String> pageKeys=["ConnectPage","DaughtersOfZion","TinyStars","AdonaiBuildingProject","HomePage"];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "ConnectPage": GlobalKey<NavigatorState>(),
    "DaughtersOfZion": GlobalKey<NavigatorState>(),
    "TinyStars": GlobalKey<NavigatorState>(),
    "AdonaiBuildingProject": GlobalKey<NavigatorState>(),
    "CellGroup": GlobalKey<NavigatorState>(),

    "Home": GlobalKey<NavigatorState>(),
  };
  List<Widget> _widgetOptions = <Widget>[
    ConnectPage(),
    DaughtersOfZion(),
    TinyStars(),
    AdonaiBuildingProject(),
    //Text('Profile'),
    CellGroup(),
    //ext('Profile'),
  ];

void _selectTab(String tabItem, int index) {
    if(tabItem == _currentPage ){
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async {
      
          final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "ConnectPage") {
            _selectTab("ConnectPage", 1);

            return false;
          }

        
        
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      } ,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Nav Bar'),
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: ImageIcon(
                AssetImage('assets/contact.png'),
    color: Colors.grey,
              ),
          ),
          actions: <Widget>[
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/bell.png'),
    color: Colors.grey,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body:Stack(
          children:<Widget> [
              _buildOffstageNavigator("ConnectPage"),
              _buildOffstageNavigator("DaughtersOfZion"),
              _buildOffstageNavigator("TinyStars"),
               _buildOffstageNavigator("AdonaiBuildingProject"),
               _buildOffstageNavigator("CellGroup"),
          ],
        ),
        
         //Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              
              icon: ImageIcon(
                AssetImage('assets/contact.png'),
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/give.png'),
              ),
              label: 'GIVE',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/media.png'),
              ),
              label: 'MEDIA',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/connect.png'),
              ),
              label: 'CONNECT',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/call.png'),
              ),
              label: 'CONTACT',
            ),
          ],
          currentIndex: _selectedIndex,
           onTap: (int index) { _selectTab(pageKeys[index], index);},
          selectedItemColor: Colors.red[500],
        ),
        
      ),
    );
  }
  
Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}






// import 'package:adonai/screens/phone/connect/connect.dart';
// import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
// import 'package:adonai/screens/phone/connect/tinystars.dart';
// import 'package:flutter/material.dart';

// class NavigationBar extends StatefulWidget {
//   const NavigationBar({Key? key}) : super(key: key);

//   @override
//   _NavigationBarState createState() => _NavigationBarState();
// }

// class _NavigationBarState extends State<NavigationBar> {
//   int _selectedIndex = 0;
//   List <String> pageKeys=["ConnectPgae","DaughtersOfZion","TinyStars"]
//   List<Widget> _widgetOptions = <Widget>[
//     ConnectPage(),
//     DaughtersOfZion(),
//     TinyStars(),
//     Text('Profile'),
//     Text('Profile'),
//     //ext('Profile'),
//   ];

//   void _onItemTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bottom Nav Bar'),
//         backgroundColor: Colors.white,
//         bottomOpacity: 0.0,
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: () {},
//           icon: ImageIcon(
//               AssetImage('assets/contact.png'),
// color: Colors.grey,
//             ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: ImageIcon(
//               AssetImage('assets/bell.png'),
// color: Colors.grey,
//             ),
//             onPressed: () {
//               // do something
//             },
//           )
//         ],
//       ),
//       body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
            
//             icon: ImageIcon(
//               AssetImage('assets/contact.png'),
//             ),
//             label: 'HOME',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage('assets/give.png'),
//             ),
//             label: 'GIVE',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage('assets/media.png'),
//             ),
//             label: 'MEDIA',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage('assets/connect.png'),
//             ),
//             label: 'CONNECT',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage('assets/call.png'),
//             ),
//             label: 'CONTACT',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTap,
//         selectedItemColor: Colors.red[500],
//       ),
//     );
//   }
// }
