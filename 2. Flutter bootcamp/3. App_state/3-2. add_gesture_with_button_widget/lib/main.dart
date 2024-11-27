import 'package:flutter/material.dart';
import 'dart:math'; // math library

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

// ✅ stateful Widget (상태값이 존재하고, 변할 수 있는 위젯)
// Mutable로 변경
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  // State <Widget타입>
  State<DicePage> createState() => _DicePageState();
}

// ✅ Dice_PageState Class
// Stateful한 DicePage 위젯을 상속함
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                // ✅ setState() : 프로퍼티의 상태를 변환 (newValue로)
                setState(() {

                  // ✅ math.dart
                  // 각종 사칙연산, 행렬 등을 담당하는 라이브러리
                  // 여기서는 Random().nextInt 메서드를 사용함 (괄호 안의 max은 최대 정수의 갯수임)

                  // 🚫 주의할 점 : nextInt(6)으로 설정하면, 범위는 0 ~ 5까지로 설정됨 (0,1,2,3,4,5)
                  // 따라서, 해당 범위를 조정하기 위해선, nextInt(6)를 그대로 유지한 채, 뒤에 '+(시작하고자 하는 정수)'를 붙여 나타냄
                  // 예를 들어, nextInt(4)+1 로 설정하게 되면, 시작은 1부터 시작되며 범위는 1,2,3,4로 설정됨
                  this.leftDiceNumber = Random().nextInt(6) + 1;
                  print('left number : $leftDiceNumber');
                });

                // ✅ setState X
                // 이렇게만 실행하게 되면, 실제 leftDiceNumber는 2로 변경되지만
                // 버튼을 눌렀을 때 실제 변경되지 않음
                // 하지만, build 위젯 내 포함되어 있으므로 Hot Reload시 2로 변경됨 (실제로 변경되었음)
                // 즉! 실제 앱이 구동하는 과정에서 프로퍼티 값을 변환하고, 이를 UI에 나타내기 위해선 -> setState 메서드 내 실행해야 함
                //   this.leftDiceNumber = 2;
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),

          Expanded(
            child: TextButton(
              onPressed: () {

              },
              child: Image.asset('images/dice2.png'),
            ),
          ),
        ],
      ),
    );
  }
}