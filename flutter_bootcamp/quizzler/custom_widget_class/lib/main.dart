import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// ✅ CustomClass (CheckerButton)
// 현재, 화면에 중복되는 형태의 Button이 2개가 존재함.
// 기존에는 State Class인 QuizePage 내부에 별도의 Widget만드는 메서드를 생성한 후 -> 이를 중복적으로 사용했음

// 🚫 문제 1. Widget의 재사용이 불가능 - 해당 클래스 내부에서만 메서드를 통해 선언된 Widget이므로, 유사한 디자인이 존재할 경우 다른 클래스에서 사용할 수 없음
// 🚫 문제 2. 가독성 문제 - children 내부에 다양한 Widget이 나열되어 있다고 가정할 때, 메서드로 선언되어 호출되는 위젯만 기본 위젯과 다소 상이한 형태
// 👉🏻 따라서, 해당 위젯을 하나의 '클래스'로 선언한 후 (상태값의 변화가 필요 없을 경우 stateless로) 사용할 것
class CustomCheckerButton extends StatelessWidget {
  final double padding;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback action;

  const CustomCheckerButton({
    super.key,
    required this.padding,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ VoidCallback type
    // 현재 button에는 onPressed라는 action, 즉 callback 함수가 실행됨
    // 이를 파라미터로 만들기 위해선, [VoidCallback]이라는 타입이 필요함

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: FilledButton(
          // ✅ style
          // 해당되는 [버튼위젯.styleForm()] 을 사용하여 스타일을 지정하자
          // 전체적인 레이아웃은 shape 프로퍼티 활용
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
          onPressed: action,
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 위젯 사이 space
      crossAxisAlignment: CrossAxisAlignment.stretch, // 가로로 최대한 늘리기

      // Column children
      // Expanded 3 Widget (Padding Center Text, Padding Button x2)
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'This is where the question text will go.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.green,
            text: 'True',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              print('true button tapped');
            }),

        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.red,
            text: 'False',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              print('true button tapped');
            }),

        // TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/