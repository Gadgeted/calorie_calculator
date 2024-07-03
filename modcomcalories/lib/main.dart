import 'package:flutter/material.dart';
import 'input.dart';
import 'result.dart';

void main() => runApp(const CalorieCalculatorApp());

class CalorieCalculatorApp extends StatelessWidget {
  const CalorieCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Calculator',
      initialRoute: '/input', // Set the initial route to the input screen
      routes: {
        '/input': (context) => const InputScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}
