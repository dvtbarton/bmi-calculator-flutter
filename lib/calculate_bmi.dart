import 'dart:math';

class BMIFunctions {
  BMIFunctions({this.height, this.weight});

  final int height; // cm
  final int weight; // kg

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2); // convert height from cm to m

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    String currentBMI = getResult();
    switch (currentBMI) {
      case 'Overweight':
        return "Too high. DO SOMETHING!";
        break;
      case 'Normal':
        return "Normal. KEEP DOING WHAT YOU'RE DOING!";
        break;
      case 'Underweight':
        return "Underweight. DO SOMETHING!";
        break;
      default:
        return "BMI error. Something went wrong";
        break;
    }
  }
}
