import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hang_man/ui/colors.dart';
//Letter that appear in the field of the missing word
Widget letter(String character, bool hidden) {
  return Container(
    height: 70,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    ),
  );
}