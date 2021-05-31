import 'package:flutter/material.dart';
import 'package:digitours/data/model/travel_destinations_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:digitours/widgets/custom_swipper_widget.dart';

class DestinationInfoScreen extends StatefulWidget {
  @override
  _DestinationInfoScreenState createState() => _DestinationInfoScreenState();
}

class _DestinationInfoScreenState extends State<DestinationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, TravelDestinationModel> arguments =
        ModalRoute.of(context).settings.arguments;
    TravelDestinationModel dest = arguments['destination'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(EvaIcons.heartOutline), onPressed: () {})
        ],
        elevation: 0,
        title: Text(
          '${dest.name}',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: dest.id,
            child: CustomSwipperWidget(
              imgUrls: dest.photos.map((pic) => pic.filePath).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                        ),
                        Text(
                          'Sagana',
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
