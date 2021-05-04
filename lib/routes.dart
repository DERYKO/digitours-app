import 'package:digitours/screens/phone_signup_screen.dart';
import 'package:digitours/screens/phone_verification_screen.dart';
import 'package:digitours/screens/splash_screen.dart';

class RouteConfig {
  static const splash = '/';
  static const phonesignupscreen = '/phonesignupscreen';
  static const phoneverificationscreen = 'phoneverificationscreen';
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.phonesignupscreen: (context) => PhoneSignUpScreen(),
  RouteConfig.phoneverificationscreen: (context) => PhoneVerificationScreen()
};
