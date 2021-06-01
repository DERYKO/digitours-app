import 'package:digitours/data/database.dart';
import 'package:digitours/data/model/travel_destinations_model.dart';
import 'package:digitours/routes.dart';
import 'package:digitours/services/travel_destinations_service.dart';
import 'package:digitours/widgets/destination_display_card.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favourites',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: db.favouritedestidsBox.listenable(),
        builder: (context, Box box, _) {
          List<TravelDestinationModel> travelDest = [];
          box.values.toList().forEach((favId) {
            travelDest.add(travelDestinationsService.traveldestinations
                .firstWhere((element) => element.id == favId));
          });

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: travelDest.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        RouteConfig.destinationinfomationscreen,
                        arguments: {'destination': travelDest[index]});
                  },
                  child: DestinationDisplayCard(
                    traveldest: travelDest[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
