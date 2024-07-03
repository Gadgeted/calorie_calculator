import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Define variables to hold user input
  late int age;
  late Gender gender = Gender.male;
  late double weight;
  late double height;
  late double activityLevel = 1.2; // Default to sedentary

  // Activity levels
  Map<String, double> activityLevels = {
    'Sedentary': 1.2,
    'Lightly active': 1.375,
    'Moderately active': 1.55,
    'Very active': 1.725,
    'Extra active': 1.9,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Your Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value)!;
                });
              },
            ),
            Row(
              children: [
                const Text('Gender: '),
                Radio(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Male'),
                Radio(
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value)!;
                });
              },
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value)!;
                });
              },
            ),
            Slider(
              min: 1.0,
              max: 5.0,
              divisions: 4,
              value: activityLevel,
              onChanged: (value) {
                setState(() {
                  activityLevel = value;
                });
              },
              label: 'Activity Level',
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            Text(
                'Activity Level: ${activityLevels.keys.elementAt((activityLevel - 1).round())}'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the result screen with arguments
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: InputData(
                    age: age,
                    gender: gender,
                    weight: weight,
                    height: height,
                    activityLevel: activityLevel,
                  ),
                );
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}

// Enum for gender selection
enum Gender { male, female }

// Class to hold input data
class InputData {
  final int age;
  final Gender gender;
  final double weight;
  final double height;
  final double activityLevel;

  InputData({
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.activityLevel,
  });
}
