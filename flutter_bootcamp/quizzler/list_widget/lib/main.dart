import 'package:flutter/material.dart';

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

// QuizPage (Stateful)
// ✅ 클래스 이름이 왜 _(언더바)로 시작하나요?
// 'private class'임을 나타냄.
// 즉, 해당 QuizePage의 상태를 관리하는 클래스 이므로, 다른 파일 혹은 클래스에서 접근할 수 없도록 함

// QuizPage State (State)
class _QuizPageState extends State<QuizPage> {

  // ✅ List
  // Widget도 할당할 수 있음!
  // 🚫 하단 유의사항 참고하기 (List<Dynamic>은 List<Widget>에 할당할 수 없다!)

  // scoreKeeper
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];

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
              setState(() {
                this.scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                );
              });
            }),

        CustomCheckerButton (
            padding: 15.0,
            backgroundColor: Colors.red,
            text: 'False',
            textColor: Colors.white,
            fontSize: 20.0,
            action: () {
              print('false button tapped');
            }),

        // TODO: Add a Row here as your score keeper
        Row(
          // children의 타입은 List<Widget>이기 때문에,
          // 상단에 선언한 scroreKeeper를 할당할 수 있음

          // ✅ List<Dynamic>은 List<Widget>에 할당할 수 없다!
          // 일반 변수의 Dynamic 타입(초기화를 하지 않고, int, String과 같은 값을 할당할 수 있음)과는 달리
          // Widget의 경우 다른 타입이 전달된다면 문제가 발생할 수 있음!
          // 예를 들어, List<Dynamic> someWidget = [ Widget1, Widget2, 'hello'] 와 같이 선언도 가능한데, 이는 List 내 dynamic 타입으로 선언되어 있기 때문임.
          // >>> 이를 만약에 children과 같이 List<Dynamic>에 할당한다? 👉🏻 문제가 발생할 수 밖에 없음

          // 결과적으로,
          // 1. cast<Type>()을 통해 type cast를 하거나
          // 2. List자체에 명시적으로 'Widget' 타임임을 명시해야 함 (V 이걸 사용하고자 함)
          children: scoreKeeper
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/