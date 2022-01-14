// ignore_for_file: file_names

import 'dart:math';

class CalculateBmi {
  CalculateBmi({required this.height, required this.weight, required this.age});
  int age;
  int height;
  int weight;
  double? _bmi;
  double calculate() {
    _bmi = weight / pow(height / 100, 2); //w/height sqr in mtr
    //how many franctions
    return _bmi!;
  }

  String getResult() {
    if (_bmi! < 18.5) {
      return 'Under Weighted';
    } else if (_bmi! > 18.5 && _bmi! <= 24.9) {
      return 'Normal Weight';
    } else if (_bmi! > 25 && _bmi! <= 29.9) {
      return 'OverWeighted';
    } else {
      return 'Obese';
    }
  }

  String interpretatiion() {
    if (_bmi! < 18.5) {
      return 'You are under Weighted and eat more food !!!!';
    } else if (_bmi! > 18.5 && _bmi! <= 24.9) {
      return 'Yeah !! You are in normal Weight ';
    } else if (_bmi! > 25 && _bmi! <= 29.9) {
      return 'Faaaaaaaaaaaat';
    } else {
      return 'Shhhhh Seriously it\'s Obese';
    }
  }
}
