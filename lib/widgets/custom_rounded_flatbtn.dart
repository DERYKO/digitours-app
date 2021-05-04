import 'package:flutter/material.dart';

class CustomRoundedFlatBtn extends StatelessWidget {
  final Function onTap;
  final double height;
  final String labelText;
  final Widget btnWidget;
  final Color color;
  final Color textColor;

  const CustomRoundedFlatBtn(
      {Key key,
      @required this.onTap,
      @required this.labelText,
      this.btnWidget,
      this.height,
      this.color = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      disabledColor: color.withOpacity(.5),
      height: height,
      onPressed: onTap,
      minWidth: double.infinity,
      child: btnWidget,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}
