import 'dart:math';

class CalculatorBrain {
  // property
  late double _bmi;

  // calculate BMI
  String calculateBMI(int height, int weight) {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // results (from BMI)
  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  // results (getInterpretation)
  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}