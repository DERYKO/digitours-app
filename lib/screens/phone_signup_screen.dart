import 'package:flutter/material.dart';

class PhoneSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/digitourslogo.png',
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/beach_suitcase_icon.png',
                height: 300,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text('Use your phone number to get started'),
            ),
            Text(
                'You may recieve an SMS for verification \n Message and data rates apply')
          ],
        ),
      ),
    );
  }
}
