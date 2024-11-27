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
                // text
                // ✅
                quizBrain.QuestionBack[questionNumber].question,
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

              // TODO: 그런데, 만약에 아래와 같이 설정하게 된다면?
              // quizBrain.QuestionBack[questionNumber].answer = true;

              // 🔴 무조건 해당 질문에 대한 답변, 즉 정답이 'true'로 계속 설정되는 문제가 발생하게 됨
              // 🔴 이는 상당히 불안정하며, 문제가 발생할 여지가 충분히 있음!
              // 👉🏻 여기서 등장하는 다음 OOP 개념을 도입해야 함

              bool answer = quizBrain.QuestionBack[questionNumber].answer;
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
              bool answer = quizBrain.QuestionBack[questionNumber].answer;
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