import 'package:flutter/material.dart';
import '../colors.dart';

SizedBox buildKeyboard(List<String> selectedChar, int tries, Function(String) onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 250.0,
    child: GridView.count(
      crossAxisCount: 8,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      padding: const EdgeInsets.all(8.0),
      children: alphabets.map((e) {
        return RawMaterialButton(
          onPressed: selectedChar.contains(e)
              ? null
              : () {
            onPressed(e);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          fillColor: selectedChar.contains(e)
              ? Colors.black
              : AppColor.primaryColorDark,
          child: Text(
            e,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    ),
  );
}

List<String> alphabets = [
  "A",
  "Á",
  "B",
  "D",
  "Ð",
  "E",
  "É",
  "F",
  "G",
  "H",
  "I",
  "Í",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "Ó",
  "P",
  "R",
  "S",
  "T",
  "U",
  "Ú",
  "V",
  "X",
  "Y",
  "Ý",
  "Þ",
  "Æ",
  "Ö",
];