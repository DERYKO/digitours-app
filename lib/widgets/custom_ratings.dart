import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class CustomRatings extends StatefulWidget {
  final int numStars;
  final bool showNumRating;

  const CustomRatings({Key key, this.numStars = 6, this.showNumRating = false})
      : super(key: key);
  @override
  _CustomRatingsState createState() => _CustomRatingsState();
}

class _CustomRatingsState extends State<CustomRatings> {
  int starRating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
              itemCount: widget.numStars,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        starRating = index + 1;
                      });
                    },
                    child: starRating <= index
                        ? Icon(
                            EvaIcons.star,
                            color: Colors.grey,
                            size: 18,
                          )
                        : Icon(
                            EvaIcons.star,
                            color: Colors.yellow,
                            size: 18,
                          ));
              }),
          SizedBox(
            width: 16,
          ),
          widget.showNumRating
              ? Text(
                  "${starRating == 0 ? "" : "$starRating"}",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
