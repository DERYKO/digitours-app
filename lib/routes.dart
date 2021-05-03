import 'package:digitours/screens/phone_signup_screen.dart';
import 'package:digitours/screens/splash_screen.dart';

class RouteConfig {
  static const splash = '/';
  static const phonesignupscreen = '/phonesignupscreen';
}

var routes = {
  RouteConfig.splash: (context) => SplashScreen(),
  RouteConfig.phonesignupscreen: (context) => PhoneSignUpScreen()
};
