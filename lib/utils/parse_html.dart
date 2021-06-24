import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

Widget htmlParser(htmlData) {
  Widget html = Html(
    data: htmlData,
  );
  return html;
}
