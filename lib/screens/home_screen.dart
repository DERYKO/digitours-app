import 'package:digitours/services/auth_service.dart';
import 'package:digitours/services/travel_destinations_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    callApis();
  }

  void callApis() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      travelDestinationsService.loadTravelDestinations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi ${authservice.authUser.name}',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: Colors.black),
          )
        ],
      ),
    ));
  }
}
