import 'package:flutter/material.dart';

class Customtxtinput extends StatelessWidget {
  final TextEditingController controller;
  final Color fillColor;
  final String labelText;
  final String hintText;
  final TextInputType textinputtype;

  const Customtxtinput(
      {Key key,
      @required this.controller,
      this.labelText,
      this.hintText,
      this.textinputtype,
      this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textinputtype,
      decoration: InputDecoration(
        labelText: labelText == null ? '' : labelText,
        filled: fillColor == null ? false : true,
        hintText: hintText == null ? '' : hintText,
        fillColor: fillColor == null ? Colors.white : fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
