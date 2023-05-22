import 'package:flutter/material.dart';
import 'package:hang_man/ui/colors.dart';

import '../main.dart';

enum Difficulty {
  fjorir,
  fimm,
  sex,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Difficulty? selectedDifficulty;

  void startGame() {
    if (selectedDifficulty != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeApp(difficulty: selectedDifficulty!),
        ),
      );
    }
  }
  String _getOptionName(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.fjorir:
        return 'Fjórir';
      case Difficulty.fimm:
        return 'Fimm';
      case Difficulty.sex:
        return 'Sex';
      default:
        return '';
    }
  }
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Veldur stafafjölda", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),


            DropdownButton<Difficulty>(
              value: selectedDifficulty,
              hint: const Text("Velja"),
              dropdownColor: AppColor.primaryColor,
              items: Difficulty.values.map((Difficulty difficulty) {
                String optionName = _getOptionName(difficulty);
                return DropdownMenuItem<Difficulty>(
                  value: difficulty,
                  child: Text(optionName, style: const TextStyle(color: Colors.white)),

                );
              }).toList(),
              onChanged: (Difficulty? value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: startGame,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor), // Change the background color
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
              child: const Text("Byrja"),
            ),
          ],
        ),
      ),
    );
  }
}
