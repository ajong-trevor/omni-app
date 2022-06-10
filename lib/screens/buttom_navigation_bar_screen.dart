import 'package:flutter/material.dart';

import 'tour_list_screen.dart';
// import 'tour_search_screen.dart';
import 'tour_settings_screen.dart';

class ButtomNavigationBarScreen extends StatefulWidget {
  @override
  _ButtomNavigationBarScreenState createState() =>
      _ButtomNavigationBarScreenState();
}

class _ButtomNavigationBarScreenState extends State<ButtomNavigationBarScreen> {
  final List<Widget> _pages = [
    TourListScreen(),
    // TourSearchScreen(),
    TourSettingsScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Theme.of(context).accentColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
