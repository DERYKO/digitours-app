import 'package:digitours/data/model/activities_model.dart';
import 'package:flutter/material.dart';

class ActivityDisplayCard extends StatelessWidget {
  final double customHeight;
  final double customWidth;
  final ActivityModel activity;

  const ActivityDisplayCard(
      {Key key, this.customHeight, this.customWidth, this.activity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: ShaderMask(
            blendMode: BlendMode.darken,
            shaderCallback: (bounds) => LinearGradient(
                begin: Alignment.centerLeft,
                colors: [Colors.black45, Colors.black45]).createShader(bounds),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.jpg',
              image: activity.coverPhoto,
              fit: BoxFit.cover,
              fadeInCurve: Curves.easeIn,
              height: customHeight,
              width: customWidth,
            ),
          ),
        ),
        Align(
          child: Text(
            activity.name,
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
