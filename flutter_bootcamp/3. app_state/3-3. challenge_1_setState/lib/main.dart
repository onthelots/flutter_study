import 'package:flutter/material.dart';
import 'dart:math'; // math library

// ✅ Challenge_1
// 2개의 주사위를 각각 눌렀을 때, 랜덤하게 숫자가 변경되도록 함

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
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  this.leftDiceNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice${leftDiceNumber}.png'),
            ),
          ),

          Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  this.rightDiceNumber = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice${rightDiceNumber}.png'),
            ),
          ),
        ],
      ),
    );
  }
}