import 'package:digitours/routes.dart';
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
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushNamed(RouteConfig.phonesignupscreen);
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
