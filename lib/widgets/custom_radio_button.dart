import 'package:flutter/material.dart';

class CustomRadioBtn extends StatefulWidget {
  final double size;

  const CustomRadioBtn({Key key, this.size = 12}) : super(key: key);
  @override
  _CustomRadioBtnState createState() => _CustomRadioBtnState();
}

class _CustomRadioBtnState extends State<CustomRadioBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.black12)),
    );
  }
}
