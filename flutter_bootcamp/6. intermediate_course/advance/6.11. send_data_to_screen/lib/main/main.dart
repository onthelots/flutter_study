import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';

void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // ✅ initalRoute
      // home에서 직접 명시해주는 것이 아닌, routes -> 즉, Naivator name을 직접 설정할 수 있음
      initialRoute: '/home',
      // home: InputPage(),

      // ✅ routes 설정
      // 2가지
      routes: {
        '/home': (context) => InputPage(),
        '/results': (context) => ResultsPage(bmiResults: '', resultText: '', interpretation: ''),
      },
    );
  }
}