import 'package:digitours/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomeBotttomNav extends StatefulWidget {
  @override
  _HomeBotttomNavState createState() => _HomeBotttomNavState();
}

class _HomeBotttomNavState extends State<HomeBotttomNav> {
  int _currentPageIndex = 0;

  set changeTabFn(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  List _pages = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(EvaIcons.homeOutline),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(EvaIcons.heartOutline),
              Icon(EvaIcons.searchOutline),
              Icon(EvaIcons.bookmarkOutline),
              Icon(EvaIcons.personOutline),
            ],
          ),
        ),
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
