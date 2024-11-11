import 'package:flutter/material.dart';
import 'Button+CustomCheckerButton.dart';
import 'quiz_brain.dart';

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

  void checkAnswer({required bool userPickedAnswer}) {
    bool correctAnswer = quizBrain.getAnswer(questionNumber);

    // 상태값이 변경되는 부분은 모두 setState로 할당할 것
    setState(() {
      // 정답
      if (userPickedAnswer == correctAnswer) {
        this.scoreKeeper.add(Icon(
          Icons.check_circle,
          color: Colors.green,
        ));

        // 오답
      } else {
        this.scoreKeeper.add(Icon(
          Icons.cancel,
          color: Colors.red,
        ));
      }

      quizBrain.nextQuestion();
    });
  }

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
              this.checkAnswer(userPickedAnswer: true);
            }),

        // 🔴 False Button
        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.red,
            text: 'False',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              this.checkAnswer(userPickedAnswer: false);
            }),

        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: scoreKeeper.map((icon) {
              return Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: icon,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}