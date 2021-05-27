import 'package:digitours/config.dart';
import 'package:digitours/routes.dart';
import 'package:digitours/services/auth_service.dart';
import 'package:digitours/services/profile_update_service.dart';
import 'package:digitours/services/travel_destinations_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authservice),
        ChangeNotifierProvider.value(value: profileupdateservice),
        ChangeNotifierProvider.value(value: travelDestinationsService),
      ],
      child: MaterialApp(
        title: 'DIGITOURS',
        theme: Config.themedata,
        initialRoute: RouteConfig.splash,
        routes: routes,
      ),
    );
  }
}
