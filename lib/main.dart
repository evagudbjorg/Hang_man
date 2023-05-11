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
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word = "Flutter";
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
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
    "Q",
    "R",
    "S",
    "T",
    "U",
    "Ú",
    "V",
    "Þ",
    "Y",
    "Ý",
    "Z",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hengimaður"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "assets/2.png"),
                figureImage(Game.tries >= 1, "assets/3.png"),
                figureImage(Game.tries >= 2, "assets/4.png"),
                figureImage(Game.tries >= 3, "assets/5.png"),
                figureImage(Game.tries >= 4, "assets/6.png"),
                figureImage(Game.tries >= 5, "assets/7.png"),
                figureImage(Game.tries >= 6, "assets/8.png"),
                figureImage(Game.tries >= 7, "assets/9.png"),
                figureImage(Game.tries >= 8, "assets/10.png"),
                figureImage(Game.tries >= 9, "assets/11.png"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split("")
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(height: 12,),
          SizedBox(
              width: double.infinity,
              height: 350.0,
              child: GridView.count(
                crossAxisCount: 6,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: alphabets.map((e) {
                  return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                        ? null // we first check that we didn't selected the button before
                        : () {
                      setState(() {
                        Game.selectedChar.add(e);
                        print(Game.selectedChar);
                        if (!word.split('').contains(e.toUpperCase())) {
                          Game.tries++;
                        }
                      });
                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
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
