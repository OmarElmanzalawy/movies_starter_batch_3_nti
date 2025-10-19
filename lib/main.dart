import 'package:flutter/material.dart';
import 'package:movies_starter/screens/home_screen.dart';
import 'package:movies_starter/view_model/app_brain.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: appBrain.isDarkMode,
      builder:(context, value, child) {
       return MaterialApp(
        theme: appBrain.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
        home: HomeScreen()
      );
      } 
    );
  }
}
