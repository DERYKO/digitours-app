import 'package:digitours/widgets/stepper.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepperWidget(
        key: UniqueKey(),
        screens: [
          OnboardCard(
            assetPath: 'assets/images/onboard1.png',
            primaryText: 'Easy to find destinations',
            secondaryText:
                'lorem ipsum dolor sit amet consectur \nadipscint elit sed',
          ),
          OnboardCard(
            assetPath: 'assets/images/onboard2.png',
            primaryText: 'Make online bookings',
            secondaryText:
                'lorem ipsum dolor sit amet consectur\nadipscint elit sed',
          ),
          OnboardCard(
            assetPath: 'assets/images/onboard1.png',
            primaryText: 'Easy to find destinations',
            secondaryText:
                'lorem ipsum dolor sit amet consectur adipscint elit sed',
          )
        ],
      ),
    );
  }
}

class OnboardCard extends StatelessWidget {
  final String assetPath;
  final String primaryText;
  final String secondaryText;

  const OnboardCard(
      {Key key, this.assetPath, this.primaryText, this.secondaryText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Image.asset(assetPath),
          Text(
            primaryText,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 20, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(secondaryText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w400)),
          )
        ],
      ),
    );
  }
}
