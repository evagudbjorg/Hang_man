import 'dart:math';

import '../home_screen.dart';
import '../utils/game.dart';

List<String> fjorirWords = [
  'Ljón',
  'Fíll',
  'Svín',
  "Kind",
  // Add more words for Difficulty.fjorir
];

List<String> fimmWords = [
  'Úlfur',
  'Fálki',
  'Fluga',
  'Ormur',
  // Add more words for Difficulty.fimm
];

List<String> sexWords = [
  'Hestur',
  'Köttur',
  "Hundur",
  'Krabbi',
  // Add more words for Difficulty.sex
];

Random random = Random();
late int randomIndex;
late String word;

