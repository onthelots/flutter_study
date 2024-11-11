import 'package:flutter/material.dart';
// ✅ 다른 파일에 존재하는 class는 import를 통해 할당 후에 사용해야 함 :(
import 'question.dart'; 

void main() => runApp(Quizzler());

// Quizzler (Stateless)
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

// CustomCheckerButton
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

// QuizPage (Stateful)
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

// QuizPage State (State)
class _QuizPageState extends State<QuizPage> {

  // tracking number
  int questionNumber = 0;

  // ✅ List 생성
  List<Question> QuestionBack = [

    // ✅ Question 인스턴스 생성
    Question(questionText: '소는 계단을 내려갈 순 있지만, 올라갈 순 없다', questionAnswer: false),
    Question(questionText: '2024년 한국에 사는 모기는 11월에도 나온다', questionAnswer: true),
    Question(questionText: '삼성전자 주식은 5만원대로 떨어질 리가 없다', questionAnswer: false),
  ];

  // Icon Widgets
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      // Column children
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // ✅ QuestionBank > questionNumber[0] > Text
                QuestionBack[questionNumber].questionText,

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // True Button
        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.green,
            text: 'True',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {

              // ✅ Answer boolean (true)
              bool answer = QuestionBack[questionNumber].questonAnswer;
              if (answer == true) {
                print('user got it right!');
              } else {
                print('user got it wrong...');
              }

              setState(() {
                // add action
                questionNumber ++;
              });
            }),

        // False Button
        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.red,
            text: 'False',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              // ✅ Answer boolean (False)
              // ✅ Answer boolean (true)
              bool answer = QuestionBack[questionNumber].questonAnswer;
              if (answer == false) {
                print('user got it right!');
              } else {
                print('user got it wrong...');
              }

              setState(() {
                // add action
                questionNumber ++;
              });
            }),

        Row(
          children: scoreKeeper
        )
      ],
    );
  }
}