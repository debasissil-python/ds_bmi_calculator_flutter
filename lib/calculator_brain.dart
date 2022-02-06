import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.weight,
    required this.height,
  });

  final int weight;
  final int height;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String resultBMI() {
    if (_bmi <= 16.0) {
      return 'Underweight\n(Severe thinness)';
    } else if (_bmi < 16.9) {
      return 'Underweight\n(Moderate thinness)';
    } else if (_bmi < 18.4) {
      return 'Underweight\n(Mild thinness)';
    } else if (_bmi <= 25) {
      return 'Normal';
    } else if (_bmi < 29.9) {
      return 'Overweight';
    } else if (_bmi < 34.9) {
      return 'Obese\n(Class I)';
    } else if (_bmi < 39.9) {
      return 'Obese\n(Class II)';
    } else
      return '(Obese\n(Class III)';
  }

  String analysisBMI() {
    if (_bmi <= 16.0) {
      return 'Health Risk : \n Possible nutritional deficiency and osteoporosis. This is severe. Please consult your Physician Immediately';
    } else if (_bmi < 16.9) {
      return 'Health Risk : \n Possible nutritional deficiency and osteoporosis. Please consult your Physician Immediately';
    } else if (_bmi < 18.4) {
      return 'Health Risk : \n Possible nutritional deficiency and osteoporosis. Your Physician should be consulted';
    } else if (_bmi <= 24.9) {
      return 'Congratulations! \n You are living a healthy life. Please keep it up';
    } else if (_bmi < 29.9) {
      return 'Health Risk : \n Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Please take care';
    } else if (_bmi < 34.9) {
      return 'Health Risk : \n High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome';
    } else if (_bmi < 39.9) {
      return 'Health Risk : \n Very High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome. Please consult your Physician';
    } else
      return 'Health Risk : \n Extremely High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome. Physician consultation advised immediately';
  }
}
