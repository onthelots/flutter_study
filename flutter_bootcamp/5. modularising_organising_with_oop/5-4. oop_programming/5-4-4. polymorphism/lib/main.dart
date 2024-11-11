import 'package:flutter/material.dart';
import 'Button+CustomCheckerButton.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

// Quizzler (Stateless)

class Quizzler extends StatelessWidget {

  // ✅ 다형성 (polymorphism)
  // @ovrride 키워드 (상위 클래스의 기능을 -> 하위 클래스에서 재 정의하여 활용)
  // 아래 코드에서도, 일반적으로 StatelessWidget의 기능을
  // 아래와 같이 커스텀하여 해당 화면만의 UI, 즉 Widget을 만듬

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
              bool answer = quizBrain.getAnswer(questionNumber);

              if (answer == true) {
                print('user got it right!');
              } else {
                print('user got it wrong...');
              }

              setState(() {
                quizBrain.nextQuestion();
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
                quizBrain.nextQuestion();
              });
            }),

        Row(
          children: scoreKeeper
        )
      ],
    );
  }
}