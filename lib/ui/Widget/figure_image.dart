import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

Stack buildFigureImages(int tries) {
  return Stack(
    children: [
      figureImage(tries >= 0, "assets/1.png"),
      figureImage(tries >= 1, "assets/2.png"),
      figureImage(tries >= 2, "assets/3.png"),
      figureImage(tries >= 3, "assets/4.png"),
      figureImage(tries >= 4, "assets/5.png"),
      if (tries >= 5 && tries <= 8) figureImage(tries >= 5, "assets/6.png"),
      if (tries >= 7)
        Stack(
          children: [
            figureImage(tries >= 6, "assets/7.png"),
            figureImage(tries >= 8, "assets/9.png"),
            figureImage(tries >= 7, "assets/8.png"),
          ],
        ),
      figureImage(tries >= 9, "assets/10.png"),
      figureImage(tries >= 10, "assets/11.png"),
    ],
  );
}

