import 'package:SAKEC_GATE/screens/vistors.dart';
import 'package:flutter/material.dart';

import 'noticeboard.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    NoticeBoard(),
    Vistors(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (ctx) => Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Notice Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Vistors',
          ),
        ],
        selectedItemColor: Color((0xff51a4da)),
        onTap: _onItemTapped,
        backgroundColor: Color(0xfff9faff),
        unselectedItemColor: Color(0xff9095A5),
      ),
    );
  }
}
