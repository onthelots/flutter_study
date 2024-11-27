import 'package:flutter/material.dart';
import 'dart:math'; // math library

// ✅ Challenge_2
// 2개의 주사위 중, 아무거나 눌렀을 때 2개의 주사위 숫자가 '모두' 변경될 수 있도록 함

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  // 초기값
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // 반복되는 작업에 대한 setState()를 감싸 allDiceNumberChanged() 메서드 생성
  void allDiceNumberChange() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                allDiceNumberChange();
              },
              child: Image.asset('images/dice${leftDiceNumber}.png'),
            ),
          ),

          Expanded(
            child: TextButton(
              onPressed: () {
                allDiceNumberChange();
              },
              child: Image.asset('images/dice${rightDiceNumber}.png'),
            ),
          ),
        ],
      ),
    );
  }
}