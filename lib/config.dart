import 'package:flutter/material.dart';

class Config {
  // static String appUrl = "https://digitours.co.ke/mobile";
  static String appUrl = "https://159.89.88.97/mobile";
  static ThemeData themedata = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.w500),
      headline2: TextStyle(fontFamily: 'Lato'),
      headline3:
          TextStyle(fontFamily: 'Thasadith', fontWeight: FontWeight.w500),
      headline4: TextStyle(
        fontFamily: 'Thasadith',
      ),
    ),
  );
}
