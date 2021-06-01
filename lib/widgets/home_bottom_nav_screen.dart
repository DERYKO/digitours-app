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
        child: Icon(
          Icons.home_outlined,
          size: 25,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.blue,
              ),
              Icon(
                EvaIcons.searchOutline,
                color: Colors.blue,
              ),
              // FloatingActionButton(
              //   onPressed: () {},
              //   child: Icon(EvaIcons.homeOutline),
              // ),
              Icon(
                EvaIcons.bookmarkOutline,
                color: Colors.blue,
              ),
              Icon(
                EvaIcons.personOutline,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
