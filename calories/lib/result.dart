import 'package:flutter/material.dart';
import 'input.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve input data from arguments
    final InputData inputData = ModalRoute.of(context)!.settings.arguments as InputData;
    
    // Calculate TDEE
    double tdee = calculateTDEE(inputData);

    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Total Daily Energy Expenditure (TDEE) is:',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '${tdee.toStringAsFixed(2)} kcal/day',
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to input screen
              },
              child: const Text('Recalculate'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate TDEE
  double calculateTDEE(InputData data) {
    double bmr;
    if (data.gender == Gender.male) {
      bmr = 88.362 + (13.397 * data.weight) + (4.799 * data.height) - (5.677 * data.age);
    } else {
      bmr = 447.593 + (9.247 * data.weight) + (3.098 * data.height) - (4.330 * data.age);
    }
    return bmr * data.activityLevel;
  }
}
