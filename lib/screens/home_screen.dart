import 'package:digitours/routes.dart';
import 'package:digitours/services/activity_service.dart';
import 'package:digitours/widgets/activity_display_card.dart';
import 'package:digitours/widgets/circular_material_spinner.dart';
import 'package:digitours/widgets/destination_display_card.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:digitours/services/auth_service.dart';
import 'package:digitours/services/travel_destinations_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Selector<TravelDestinationsService, bool>(
            selector: (context, traveldestinationservice) =>
                traveldestinationservice.isGettingTravelDest,
            builder: (context, gettingTravel, _) {
              return CircularMaterialSpinner(
                color: Colors.blue,
                height: 50,
                width: 50,
                loading: gettingTravel,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi ${authservice.authUser.name},\nWelcome to DigiTours',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Enjoy a world of pure beauty.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(.2),
                              border: Border.all(color: Colors.grey, width: 2)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(),
                    Flexible(flex: 1, child: ActivitiesWidget()),
                    SizedBox(
                      height: 8,
                    ),
                    Flexible(flex: 5, child: PopularDestinationsWidget())
                  ],
                ),
              );
            }),
      ),
    ));
  }
}

class ActivitiesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: activityservice.activites.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: ActivityDisplayCard(
            activity: activityservice.activites[index],
            customHeight: 180,
            customWidth: 180,
          ),
        );
      },
    );
  }
}

class PopularDestinationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Destinations',
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Icon(EvaIcons.optionsOutline),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: travelDestinationsService.traveldestinations.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        RouteConfig.destinationinfomationscreen,
                        arguments: {
                          'destination': travelDestinationsService
                              .traveldestinations[index]
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DestinationDisplayCard(
                      traveldest:
                          travelDestinationsService.traveldestinations[index],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
