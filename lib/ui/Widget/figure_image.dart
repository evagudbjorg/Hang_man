import 'package:flutter/cupertino.dart';

Widget figureImage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: Container(
        width: 450,
        height: 450,
        child: Image.asset(path),
      )
  );
}