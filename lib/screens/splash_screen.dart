import 'package:digitours/data/database.dart';
import 'package:digitours/routes.dart';
import 'package:digitours/services/auth_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await db.init();
    await Future.delayed(Duration(seconds: 1));
    if (authservice.showOnboardScreens) {
      Navigator.of(context).pushReplacementNamed(RouteConfig.onboardingscreen);
    } else if (authservice.authUser == null) {
      Navigator.of(context).pushReplacementNamed(RouteConfig.phonesignupscreen);
    } else {
      Navigator.of(context).pushReplacementNamed(RouteConfig.homeBottomNav);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'DIGITOURS',
        style: TextStyle(fontWeight: FontWeight.w500),
      )),
    );
  }
}
