import 'package:flutter/material.dart';
import 'Button+CustomCheckerButton.dart';
import 'quiz_brain.dart';

// ✅ QuizBrain 객체 가져오기!
QuizBrain quizBrain = QuizBrain();

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

// QuizPage (Stateful)
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

// QuizPage State (State)
class _QuizPageState extends State<QuizPage> {

  // tracking number
  int questionNumber = 0;

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

                // ✅ 은닉화, 즉 해당 클래스의 property를 private로 변경한다면?
                // 👉🏻 quiz_brain 클래스 내 questionBank로 접근을 시도 자체가 불가능함 (변경하거나, 참조 모두)
                // 👉🏻 따라서, 아래와 같이 클래스 내부에서 제공하는 메서드(내부-해당 모듈-에서는 접근이 가능하니, answer를 반환하는 메서드를 생성)를 아래와 같이 불러옴

                // getQuestionText (현재 questionNumber에 따른 Answer) 반환
                quizBrain.getQuestionText(questionNumber),

                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        // 🟢 True Button
        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.green,
            text: 'True',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              // ✅ 은닉화 (Encapsulation)
              // 아래와 같이, 해당 인스턴스의 값(property)을 현재 코드에서 임의로 변경할 수 있는 문제가 발생 (모든 질문의 답을 true로 만드는 불상사가 발생)
              bool answer = quizBrain.getAnswer(questionNumber);

              if (answer == true) {
                print('user got it right!');
              } else {
                print('user got it wrong...');
              }

              setState(() {
                quizBrain.nextQuestion(); // ✅ 조건식에 따른 questionNumber 증가
              });
            }),

        // 🔴 False Button
        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.red,
            text: 'False',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              var answer = quizBrain.getAnswer(questionNumber);

              if (answer == false) {
                print('user got it right!');
              } else {
                print('user got it wrong...');
              }

              setState(() {
                quizBrain.nextQuestion(); // ✅ 조건식에 따른 questionNumber 증가
              });
            }),

        Row(
          children: scoreKeeper
        )
      ],
    );
  }
}