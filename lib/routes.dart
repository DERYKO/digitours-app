import 'package:digitours/screens/home_screen.dart';
import 'package:digitours/screens/phone_signup_screen.dart';
import 'package:digitours/screens/phone_verification_screen.dart';
import 'package:digitours/screens/splash_screen.dart';

class RouteConfig {
  static const splash = '/';
  static const phonesignupscreen = '/phonesignupscreen';
  static const phoneverificationscreen = 'phoneverificationscreen';
  static const homescreen = '/homescreen';
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.phonesignupscreen: (context) => PhoneSignUpScreen(),
  RouteConfig.phoneverificationscreen: (context) => PhoneVerificationScreen(),
  RouteConfig.homescreen: (context) => HomeScreen()
};
