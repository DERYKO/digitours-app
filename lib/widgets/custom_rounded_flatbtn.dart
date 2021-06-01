import 'package:flutter/material.dart';

class CustomRoundedFlatBtn extends StatelessWidget {
  final Function onTap;
  final double height;
  final double width;
  final String labelText;
  final Widget btnWidget;
  final Color color;
  final Color textColor;

  const CustomRoundedFlatBtn(
      {Key key,
      @required this.onTap,
      this.labelText,
      this.btnWidget,
      this.height = 50.0,
      this.width,
      this.color = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: color.withOpacity(.5),
      height: height,
      onPressed: onTap,
      minWidth: width == null ? double.infinity : width,
      child: btnWidget,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}
