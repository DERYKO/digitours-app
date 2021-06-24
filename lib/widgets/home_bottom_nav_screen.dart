import 'package:digitours/screens/favourites_screen.dart';
import 'package:digitours/screens/home_screen.dart';
import 'package:digitours/screens/profile_screen.dart';
import 'package:digitours/screens/search_screen.dart';
import 'package:digitours/services/activity_service.dart';
import 'package:digitours/services/travel_destinations_service.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomeBotttomNav extends StatefulWidget {
  @override
  _HomeBotttomNavState createState() => _HomeBotttomNavState();
}

class _HomeBotttomNavState extends State<HomeBotttomNav> {
  int _currentPageIndex = 0;

  void changeTabFn(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  List _pages = [
    HomeScreen(),
    FavouritesScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      travelDestinationsService.loadTravelDestinations();
      activityservice.loadActivities();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeTabFn(0);
        },
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
              GestureDetector(
                onTap: () {
                  changeTabFn(1);
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.blue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeTabFn(2);
                },
                child: Icon(
                  EvaIcons.searchOutline,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                EvaIcons.bookmarkOutline,
                color: Colors.blue,
              ),
              GestureDetector(
                onTap: () {
                  changeTabFn(3);
                },
                child: Icon(
                  EvaIcons.personOutline,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
