import 'package:flutter/material.dart';

class Dot extends StatefulWidget {
  final bool animate;
  final Color primaryColor;
  final Color secondaryColor;
  final Duration animateTime;
  final int size;

  const Dot(
      {Key key,
      this.animate,
      this.primaryColor = Colors.grey,
      this.secondaryColor = Colors.orange,
      this.animateTime,
      this.size})
      : super(key: key);

  @override
  _DotState createState() => _DotState();
}

class _DotState extends State<Dot> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: null);
  }
}
