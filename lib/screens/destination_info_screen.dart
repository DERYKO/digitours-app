import 'package:digitours/utils/parse_html.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:digitours/data/database.dart';
import 'package:digitours/data/model/travel_destinations_model.dart';
import 'package:digitours/services/favourites_service.dart';
import 'package:digitours/widgets/custom_ratings.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:digitours/widgets/custom_swipper_widget.dart';

class DestinationInfoScreen extends StatefulWidget {
  @override
  _DestinationInfoScreenState createState() => _DestinationInfoScreenState();
}

final _scaffoldKey = GlobalKey<ScaffoldState>();

class _DestinationInfoScreenState extends State<DestinationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, TravelDestinationModel> arguments =
        ModalRoute.of(context).settings.arguments;
    TravelDestinationModel dest = arguments['destination'];
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            ValueListenableBuilder(
                valueListenable: db.favouritedestidsBox.listenable(),
                builder: (context, Box box, _) {
                  return IconButton(
                    icon: box.values.contains(dest.id)
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.red,
                          ),
                    onPressed: () {
                      box.values.contains(dest.id)
                          ? favouriteService.removeFavourite(dest.id)
                          : favouriteService.setFavourite(dest.id);
                    },
                    splashColor: Colors.red[100],
                  );
                })
          ],
          elevation: 0,
          title: Text(
            '${dest.name}',
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Hero(
                tag: dest.photos.first.filePath,
                child: CustomSwipperWidget(
                  imgUrls: dest.photos.map((pic) => pic.filePath).toList(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.place_outlined,
                                  color: Colors.black54,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Kirinyaga County',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Flexible(
                              child: CustomRatings(
                                numStars: 5,
                                showNumRating: true,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  EvaIcons.clockOutline,
                                  color: Colors.black54,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '3 days',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Builder(
                          builder: (context) {
                            return CustomRoundedFlatBtn(
                              height: 40,
                              onTap: () {
                                if (dest.package.isNotEmpty) {
                                  openbookingBottomSheet(context, dest);
                                }
                              },
                              btnWidget: Text('Book Travel'),
                              color: Colors.orangeAccent,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Trip',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: BookingsCardWidget(
                  traveldest: dest,
                ),
              ),
            ]));
  }
}

class BookingsCardWidget extends StatefulWidget {
  final TravelDestinationModel traveldest;

  const BookingsCardWidget({Key key, this.traveldest}) : super(key: key);
  @override
  _BookingsCardWidgetState createState() => _BookingsCardWidgetState();
}

class _BookingsCardWidgetState extends State<BookingsCardWidget> {
  int selectedPackageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bookings',
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 16,
          ),
          Flexible(
            child: Container(
              height: 40,
              child: ListView.builder(
                itemCount: widget.traveldest?.package?.length ?? 0,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomRoundedFlatBtn(
                    width: 200,
                    height: 25,
                    onTap: () {
                      setState(() {
                        selectedPackageIndex = index;
                      });
                    },
                    color: selectedPackageIndex == index
                        ? Colors.blue
                        : Colors.white,
                    btnWidget: Text(
                      'Package ${index + 1}',
                      style: TextStyle(
                        color: selectedPackageIndex == index
                            ? Colors.white
                            : Colors.blue,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          widget.traveldest.package.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.traveldest.package[0].description}'),
                    
                  ],
                )
              : SizedBox()
        ],
      ),
    );
  }
}

openbookingBottomSheet(
    BuildContext context, TravelDestinationModel traveldest) {
  return showBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: traveldest?.package?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomRoundedFlatBtn(
                            width: 200,
                            height: 25,
                            onTap: () {},
                            color: Colors.blue,
                            btnWidget: Text(
                              'Package ${index + 1}',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TitleHtmlcolumn(
                      title: "Exclusive",
                      htmldata: traveldest.package[0].exclusive,
                    ),
                    TitleHtmlcolumn(
                      title: "Inclusive",
                      htmldata: traveldest.package[0].inclusive,
                    ),
                    TitleHtmlcolumn(
                      title: "Itinerary",
                      htmldata: traveldest.package[0].itinerary,
                    ),
                    TitleHtmlcolumn(
                      title: "Requirements",
                      htmldata: traveldest.package[0].requirement,
                    ),
                    TitleHtmlcolumn(
                      title: "Policy",
                      htmldata: traveldest.package[0].policy,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRoundedFlatBtn(
                onTap: () {},
                btnWidget: Text('Book Travel'),
                color: Colors.orangeAccent,
              ),
            )
          ],
        );
      });
}

class TitleHtmlcolumn extends StatelessWidget {
  final String title;
  final String htmldata;
  const TitleHtmlcolumn({
    Key key,
    this.title,
    this.htmldata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '$title',
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        htmlParser(htmldata),
      ],
    );
  }
}
