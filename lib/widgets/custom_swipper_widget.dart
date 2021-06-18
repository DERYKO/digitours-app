import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomSwipperWidget extends StatelessWidget {
  final List<String> imgUrls;

  const CustomSwipperWidget({Key key, this.imgUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: imgUrls.length,
      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
      itemHeight: MediaQuery.of(context).size.height * 0.25,
      layout: SwiperLayout.STACK,
      autoplay: true,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder.jpg',
            image: imgUrls[index],
            fit: BoxFit.cover,
            fadeInCurve: Curves.easeIn,
          ),
        );
      },
    );
  }
}
