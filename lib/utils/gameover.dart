import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final VoidCallback restartGame;

  const GameOverScreen({super.key, required this.restartGame});

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red), // Change the background color
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                          fontSize: 30,
                          fontWeight:
                          FontWeight.bold)), // Change the text style
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10)), // Change the padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Change the border radius
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
}
