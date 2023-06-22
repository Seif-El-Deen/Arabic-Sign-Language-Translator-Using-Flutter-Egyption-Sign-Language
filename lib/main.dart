import 'package:flutter/material.dart';
import 'package:gp_project/screens/home/camera_try.dart';
import 'package:gp_project/screens/home/home.dart';
import 'package:gp_project/screens/learning/letters_learning_screen.dart';
import 'package:gp_project/screens/tab_bar_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أسمعنى',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Cairo",
      ),
      // home: VideoCaptureScreen(),
      home: HomeScreen(),
    );
  }
}
