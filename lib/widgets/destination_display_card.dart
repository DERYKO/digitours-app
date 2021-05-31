import 'package:digitours/data/model/travel_destinations_model.dart';
import 'package:flutter/material.dart';

class DestinationDisplayCard extends StatelessWidget {
  final TravelDestinationModel traveldest;

  const DestinationDisplayCard({Key key, this.traveldest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return traveldest.photos.isNotEmpty
        ? Hero(
            tag: traveldest.id,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: ShaderMask(
                    blendMode: BlendMode.darken,
                    shaderCallback: (bounds) => LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [Colors.black54, Colors.transparent])
                        .createShader(bounds),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.jpg',
                      image: traveldest?.photos?.first?.filePath,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.place_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Sagana',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          '${traveldest.name}',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ))
              ],
            ),
          )
        : SizedBox();
  }
}
