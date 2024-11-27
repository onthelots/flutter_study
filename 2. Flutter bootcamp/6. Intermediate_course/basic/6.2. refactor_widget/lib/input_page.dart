import 'package:flutter/material.dart';

// 🔴 InputPage (stful)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B1033),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w200),
        backgroundColor: Color(0xFF111639),
      ),

      // Expaneded (https://fronquarry.tistory.com/15 참고)
      body: SafeArea(
        // > column
        child: Column(
          // > children (3 Expanded widget)
          // column 형태가 body의 SafeArea
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(

                    // ✅ Extract Widget
                    // Widget Outline을 눌러, Extract (추출) 하고자 하는 위젯을 새로운 Class로 생성할 수 있음
                    // 이처럼, 반복되는 위젯을 하나로 묶어서 간단하게 활용 가능
                    child: ReusableCard(boxColor: Color(0xff282B4E)),
                  ),
                  Expanded(
                    child: ReusableCard(boxColor: Color(0xff282B4E)),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ReusableCard(boxColor: Color(0xff282B4E)),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(boxColor: Color(0xff282B4E)),
                  ),
                  Expanded(
                    child: ReusableCard(boxColor: Color(0xff282B4E)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extract Widget (Stateless Widget)
class ReusableCard extends StatelessWidget {

  // 🚫 Error
  // This class (or a class that this class inherits from) is marked as '@immutable',
  // but one or more of its instance fields aren't final: ReusableCard.

  // 👉🏻 다음 세션에 알아보자.
  Color boxColor;

  ReusableCard({required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0), // margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),
    );
  }
}
