import 'package:digitours/routes.dart';
import 'package:digitours/widgets/custom_radio_button.dart';
import 'package:digitours/widgets/custom_rounded_flatbtn.dart';
import 'package:flutter/material.dart';

class PersonalIzeScreen extends StatefulWidget {
  @override
  _PersonalIzeScreenState createState() => _PersonalIzeScreenState();
}

class _PersonalIzeScreenState extends State<PersonalIzeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                'Personalize your tours and destinations',
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                'Get to control destinations that best fit you. Later you can add as much categories as you need',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 17, color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: [
                    ActivityCard(
                      imageAsset: 'assets/images/biking.png',
                    ),
                    ActivityCard(
                      imageAsset: 'assets/images/paintball.png',
                    ),
                    ActivityCard(
                      imageAsset: 'assets/images/zipline.png',
                    ),
                    ActivityCard(
                      imageAsset: 'assets/images/kayaking.png',
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  child: CustomRoundedFlatBtn(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConfig.namemailregscreen);
                    },
                    btnWidget: Text('Complete'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String imageAsset;

  const ActivityCard({Key key, this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomRadioBtn(
              size: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                imageAsset,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            )
          ]),
        ));
  }
}
