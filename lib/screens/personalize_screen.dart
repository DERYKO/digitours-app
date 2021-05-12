import 'package:flutter/material.dart';

class PersonalIzeScreen extends StatefulWidget {
  @override
  _PersonalIzeScreenState createState() => _PersonalIzeScreenState();
}

class _PersonalIzeScreenState extends State<PersonalIzeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personalize your tours and destinations',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Get to control destinations that best fit you. Later you can add as much categories as you need',
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
