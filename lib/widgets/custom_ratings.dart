import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class CustomRatings extends StatefulWidget {
  final int numStars;

  const CustomRatings({Key key, this.numStars = 6}) : super(key: key);
  @override
  _CustomRatingsState createState() => _CustomRatingsState();
}

class _CustomRatingsState extends State<CustomRatings> {
  int starRating;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: ListView.builder(
          itemCount: widget.numStars,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    starRating = index;
                  });
                },
                child: starRating <= index
                    ? Icon(
                        EvaIcons.starOutline,
                        color: Colors.yellow,
                      )
                    : Icon(
                        EvaIcons.star,
                        color: Colors.yellow,
                      ));
          }),
    );
  }
}
