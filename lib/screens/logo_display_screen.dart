import 'package:digitours/routes.dart';
import 'package:flutter/material.dart';

class LogoDisplayScreen extends StatefulWidget {
  @override
  _LogoDisplayScreenState createState() => _LogoDisplayScreenState();
}

class _LogoDisplayScreenState extends State<LogoDisplayScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(RouteConfig.phonesignupscreen);
    // Navigator.push(
    //     context,
    //     PageRouteBuilder(
    //         transitionDuration: Duration(seconds: 2),
    //         pageBuilder: (_, __, ___) => PhoneSignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            'assets/images/digitourslogo.png',
            height: 100,
          ),
        ),
      ),
    );
  }
}
