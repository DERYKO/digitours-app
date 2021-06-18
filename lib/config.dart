import 'package:flutter/material.dart';

class Config {
  // static String appUrl = "https://digitours.co.ke/mobile";
  static String appUrl = "http://143.198.169.255/mobile";
  static ThemeData themedata = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontFamily: 'Lato', fontWeight: FontWeight.w500, color: Colors.black),
      headline2: TextStyle(fontFamily: 'Lato'),
      headline3: TextStyle(
          fontFamily: 'Thasadith',
          fontWeight: FontWeight.w500,
          color: Colors.black),
      headline4: TextStyle(
        fontFamily: 'Thasadith',
      ),
    ),
  );
}
