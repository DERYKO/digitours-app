import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showFilterModalSheet({
  @required context,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return ListView(
        children: [Text('Filter')],
      );
    },
  );
}
