import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // >>>>> 🚫 기존의 lifting state up 방식의 문제점
  /*
  - MyApp에서의 데이터(data)를, Level3까지 전달하기 위해서
  - 위젯 트리 구조에 따라, Level1, Level2까지 모두 초기화를 거친 후에야 비로소 전달하는 [비 효율성]을 보이고 있음!
  - 관리, 보수의 어려움과 흐름을 따라가질 못할 수도 있음 😭
   */
  final String data = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(data),
        ),
        body: Level1(data),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  final String data;
  Level1(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(data),
    );
  }
}

class Level2 extends StatelessWidget {
  final String data;
  Level2(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(data),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  final String data;
  Level3(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
