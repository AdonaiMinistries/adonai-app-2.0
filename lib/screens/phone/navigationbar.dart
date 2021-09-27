import 'package:adonai/screens/phone/connect/connect.dart';
import 'package:adonai/screens/phone/connect/daughtersofzion.dart';
import 'package:adonai/screens/phone/connect/tinystars.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ConnectPage(),
    DaughtersOfZion(),
    TinyStars(),
    Text('Profile'),
    Text('Profile'),
    //ext('Profile'),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
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
        onTap: _onItemTap,
        selectedItemColor: Colors.red[500],
      ),
    );
  }
}
