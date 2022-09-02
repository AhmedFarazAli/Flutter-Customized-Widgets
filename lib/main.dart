import 'package:flutter/material.dart';

import 'Screens/input_page.dart';
import 'Screens/result_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Color(0xFF1D2136),centerTitle: true,titleTextStyle: TextStyle(fontSize: 20),),
        scaffoldBackgroundColor: const Color(0xFF1D2136),
      ),
      initialRoute: 'first',
      // home: const InputPage(),
      routes: {
        'first':(context)=>const InputPage(),
        'second':(context)=>ResultPage(bmiRemarks: '',bmiResult: '',heading: '',)
      },
    );
  }
}

