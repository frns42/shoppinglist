import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/pages/ListPage.dart';
import 'package:shopping_list/pages/SettingsPage.dart';
import 'package:shopping_list/pages/AddListPage.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
  Consumer<ApplicationState>(builder: (context, appState, _) => ListPage(appState)),
    Consumer<ApplicationState>(builder: (context, appState, _) => AddListPage(appState)),
    Consumer<ApplicationState>(builder: (context, appState, _) => SettingsPage(appState)),
  ];

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: PageView(
        controller: _pageController,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _onItemTapped,
        color: Colors.white,
        backgroundColor: Colors.deepOrange,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
      ),
    );
  }
}
