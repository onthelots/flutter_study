import 'package:flutter/material.dart';
import 'Button+CustomCheckerButton.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


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

        // ✅ Widgets
        // Padding >
          // child : Row
            // children : scoreKeeper (Dart에서의 List는 Iterable을 반환하기 때문에 -> 리스트트 형태로 바꾸기 위해 .toList()를 호출해야 함)
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: scoreKeeper.map((icon) {
              // return
              // scoreKeeper는 List<Icon> 타입인데, 이를 map을 활용하게 되면 List<Widget> 형태로 '반환'이 가능함.
              // 즉, 내부적으로 변환할 때, List<Icon> -> List<Flexible> 타입으로 변환한 후, .toList()를 통해 재 변환함

              // ✅ Flexible : 주어진 영역에서 '자식 위젯' 필요한 만큼 공간을 차짛하도록 함.
              // Row, Column과 같은 부모 위젯 내에서 사용되며, 자식 위젯의 크기를 조정 / 레이아웃을 유연하게 함
              return Flexible(

                // ✅ FittedBox : 자식 위젯의 크기를, 부모 위젯에 맞추는 위젯 타입
                // BoxFit 열거형을 통해, 맞추는 방식을 설정할 수 있음.
                // scaleDown : 자식 위젯의 크기를, 부모 위젯의 최대 크기로 맞춤. 예를 들어 자식 위젯이 점점 커져도, 부모 위젯에 맞춰져야 하기 때문에 자동으로 Scale을 작게 만듬
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