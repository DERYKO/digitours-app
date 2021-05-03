import 'package:flutter/material.dart';

class CustomRoundedFlatBtn extends StatelessWidget {
  final Function onTap;
  final String labelText;
  final Color color;
  final Color textColor;

  const CustomRoundedFlatBtn(
      {Key key,
      @required this.onTap,
      @required this.labelText,
      this.color = Colors.blue,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      minWidth: double.infinity,
      child: Text(labelText),
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }
}
