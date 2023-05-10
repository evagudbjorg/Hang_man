import 'package:flutter/material.dart';
import 'package:hang_man/ui/Widget/figure_image.dart';
import 'package:hang_man/ui/colors.dart';

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
      figureImage(true, "")
      ],
    ),
    )
    ],
    ),
      );
  }
}
