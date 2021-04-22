import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Too much ! Get , Set , Exercise and Go!!';
    } else if (_bmi > 18.5) {
      return 'Ahhan ! Good job hooman ! ';
    } else {
      return 'Too low ! Go have some food at your favorite restaurant';
    }
  }
}
