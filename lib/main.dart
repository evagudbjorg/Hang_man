import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hang_man/ui/Widget/figure_image.dart';
import 'package:hang_man/ui/Widget/letter.dart';
import 'package:hang_man/ui/colors.dart';
import "package:hang_man/utils/game.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}
//hidden word
class _HomeAppState extends State<HomeApp> {
  String word = "Flutter";
  //alphabet that appears
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        //header
        title: const Text(
          "HENGIMAÐUR",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          const SizedBox(
            height: 10,
          ),
          //hidden word widget
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
            //split the choosen word
                .split("")
            //but it to uppercase
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          Center(
            child: Stack(
              //New photo will be added after each try
              children: [
                figureImage(Game.tries >= 0, "assets/1.png"),
                figureImage(Game.tries >= 1, "assets/2.png"),
                figureImage(Game.tries >= 2, "assets/3.png"),
                figureImage(Game.tries >= 3, "assets/4.png"),
                figureImage(Game.tries >= 4, "assets/5.png"),
                figureImage(Game.tries >= 5, "assets/6.png"),
                figureImage(Game.tries >= 6, "assets/7.png"),
                figureImage(Game.tries >= 7, "assets/8.png"),
                figureImage(Game.tries >= 8, "assets/9.png"),
                figureImage(Game.tries >= 9, "assets/10.png"),
                figureImage(Game.tries >= 10, "assets/11.png"),
              ],
            ),
          ),

          const SizedBox(height: 20,),

          //keyboard
          SizedBox(
              width: double.infinity,
              height: 250.0,
              child: GridView.count(
                crossAxisCount: 8,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(8.0),
                children: alphabets.map((e) {
                  return RawMaterialButton(
                    //game logic
                    onPressed: Game.selectedChar.contains(e)
                        ? null // we first check that we didn't selected the button before
                        : () {
                      setState(() {
                        // add the character e to the selectedChar list of Game object
                        Game.selectedChar.add(e);
                        // print the contents of selectedChar to the console
                        print(Game.selectedChar);
                        //if the word does not contain the character e, game tries in increased by one

                        if (!word.split('').contains(e.toUpperCase())) {
                          Game.tries++;
                        }
                      });
                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  fillColor: Game.selectedChar.contains(e)
                    ? Colors.black
                    : AppColor.primaryColorDark,
                  );
                }).toList(),
              ),
          )
        ],
      ),
    );

  }
}
