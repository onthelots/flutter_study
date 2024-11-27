import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart'; // rflutter_alert import
import 'quiz_brain.dart';

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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain(); // quizBrain 인스턴스

  // 1) 버튼 인터렉션 시, 체크
  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // 마지막 버튼을 눌렀을 때, 종료되었기 때문에 alert를 띄울 것
      if (quizBrain.isFinished() == true) {
        // 마지막 버튼을 눌렀을 때, 종료되었기 때문에 alert를 띄울 것
        // 활용한 자원 모두 초기화 실시

        Alert(
          context: context,
          title: 'Quizzler ended',
          buttons: [
            DialogButton(child: Text('Reset'), onPressed: () {
              Navigator.of(context).pop(); // pop
            })
          ]
        ).show();

        quizBrain.reset(); // number 초기화
        this.scoreKeeper = []; // scoreKeeper(icon) 비워주기

      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

// PopupDialog Class
class PopupDialog extends StatelessWidget {

  // CallBack 함수 생성
  final VoidCallback onPressed;

  const PopupDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FilledButton(
        child: Text('Ok'),
        onPressed: () {
          // 콜백을 호출하여 QuizPage에서 정의한 로직 실행
          onPressed();
          Navigator.of(context).pop();  // 다이얼로그 닫기
        },
      ),
    );
  }
}


