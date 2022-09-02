
import 'dart:math';

class BmiBrain{
  BmiBrain( {required this.weight,required this.height});
  late final double height;
  late final int weight;
  double _bmi=0;
  String bmicalculate(){
    _bmi= weight/pow(height/3.281, 2).toDouble();
    return _bmi.toStringAsFixed(1);
  }
  String bmiRemarks(){
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
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

}

