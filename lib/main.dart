import 'package:flutter/material.dart';
import 'package:hang_man/ui/Widget/figure_image.dart';
import 'package:hang_man/ui/Widget/letter.dart';
import 'package:hang_man/ui/colors.dart';
import "package:hang_man/utils/game.dart";
import 'package:hang_man/ui/Widget/alphabet.dart';
import 'package:hang_man/data/Difficulty.dart';
import 'utils/home_screen.dart';
import "package:hang_man/utils/gameover.dart";
import "package:hang_man/utils/wordGuessed.dart";

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeApp extends StatefulWidget {
  final Difficulty difficulty;

  const HomeApp({Key? key, required this.difficulty}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  void restartGame() {
    setState(() {
      Game.selectedChar.clear();
      Game.tries = 0;
      if (widget.difficulty == Difficulty.fjorir) {
        word = fjorirWords[randomIndex];
      } else if (widget.difficulty == Difficulty.fimm) {
        word = fimmWords[randomIndex];
      } else if (widget.difficulty == Difficulty.sex) {
        word = sexWords[randomIndex];
      } else {
        // Default word list if difficulty is not set
        word = '';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.difficulty == Difficulty.fjorir) {
      randomIndex = random.nextInt(fjorirWords.length);
      word = fjorirWords[randomIndex];
    } else if (widget.difficulty == Difficulty.fimm) {
      randomIndex = random.nextInt(fimmWords.length);
      word = fimmWords[randomIndex];
    } else if (widget.difficulty == Difficulty.sex) {
      randomIndex = random.nextInt(sexWords.length);
      word = sexWords[randomIndex];
    } else {
      // Default word list if difficulty is not set
      word = '';
    }
  }

  bool isWordGuessed() {
    for (var letter in word.toUpperCase().split('')) {
      if (!Game.selectedChar.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  bool isGameOver() {
    return Game.tries >= 11;
  }

  @override
  Widget build(BuildContext context) {
    if (isWordGuessed()) {
      return WordGuessedScreen(restartGame: restartGame);
    }
    if (isGameOver()) {
      return GameOverScreen(restartGame: restartGame);
    }
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
            height: 20,
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
            child: buildFigureImages(Game.tries),
          ),
          //keyboard
          buildKeyboard(
            Game.selectedChar,
            Game.tries,
            (String selectedChar) {
              setState(() {
                Game.selectedChar.add(selectedChar);
                print(Game.selectedChar);
                if (!word.toUpperCase().contains(selectedChar.toUpperCase())) {
                  Game.tries++;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
