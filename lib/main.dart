import 'package:flutter/material.dart';
import 'package:hang_man/ui/Widget/figure_image.dart';
import 'package:hang_man/ui/Widget/letter.dart';
import 'package:hang_man/ui/colors.dart';
import "package:hang_man/utils/game.dart";
import 'package:hang_man/ui/Widget/alphabet.dart';
import 'package:hang_man/data/Difficulty.dart';
import 'package:hang_man/utils/restartGame.dart';
import 'home_screen.dart';

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
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
            title: const Text(
              "HENGIMAÐUR",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          body: Center(
            child: Container(
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text(
                'Þú vannst!',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: restartGame,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Change the background color
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)), // Change the text style
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10)), // Change the padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Change the border radius
                    ),
                  ),
                ),
                child: const Text('Spila aftur'),
              ),
              ],
              ),
            ),
          ),
        );
      }

      if (isGameOver()) {
        return Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Text(
              "HENGIMAÐUR",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'þú tapaðir :(',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: restartGame,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Change the background color
                      textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)), // Change the text style
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10)), // Change the padding
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Change the border radius
                        ),
                          ),
                        ),
                    child: const Text('Spila aftur'),
                  ),
                ],

              ),
            ),
          ),
        );
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
            child: Stack(
              //New photo will be added after each try
              children: [
                figureImage(Game.tries >= 0, "assets/1.png"),
                figureImage(Game.tries >= 1, "assets/2.png"),
                figureImage(Game.tries >= 2, "assets/3.png"),
                figureImage(Game.tries >= 3, "assets/4.png"),
                figureImage(Game.tries >= 4, "assets/5.png"),
                //figureImage(Game.tries >= 5, "assets/6.png"),
                //this let 6.png appear after 5th try and removes it at 9th try
                if (Game.tries >= 5 && Game.tries <= 8) figureImage(Game.tries >= 5, "assets/6.png"),
                //figureImage(Game.tries >= 6, "assets/7.png"),
                //figureImage(Game.tries >= 7, "assets/8.png"),
                if (Game.tries >= 7)
                  Stack(
                    children: [
                      figureImage(Game.tries >= 6, "assets/7.png"),
                      figureImage(Game.tries >= 8, "assets/9.png"),
                      figureImage(Game.tries >= 7, "assets/8.png"),
                    ],
                  ),
                //figureImage(Game.tries >= 8, "assets/9.png"),
                figureImage(Game.tries >= 9, "assets/10.png"),
                figureImage(Game.tries >= 10, "assets/11.png"),
              ],
            ),
          ),
          // Display "You won" or "You lost" based on game status


    //const SizedBox(height: 5),

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

                        if (!word.toUpperCase().contains(e.toUpperCase())) {
                          Game.tries++;
                        }
                      });
                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  fillColor: Game.selectedChar.contains(e)
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
          )
        ],
      ),
    );

  }
}
