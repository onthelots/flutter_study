import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // ✅ Provider 적용
  /*
  - Rift 방식이 아니라, 👉🏻  MyApp에서 관리하는 데이터를, Level3가 Listening 하는 방식으로 변경한다면?
  - 불 필요한 전달방식을 줄일 뿐만이 아니라, build 과정 또한 연속적으로 일어날 이유가 없음.
   */
  final String data = 'Top Secret Data with Provider';

  @override
  Widget build(BuildContext context) {

    // 1) Provider Widget으로 감싸고, 타입을 설정 < >
    // - Provider는, 상태를 관리하고 전달하는 상태 제공자 위젯
    return Provider<String>(
      // 2) `create`를 사용하여 `data` 값을 Provider로 생성
      create: (context) => data,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(data),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // String data = Provider.of<String>(context);  // 상태를 구독하고 데이터 가져오기

    // 3) Provider 상태 구독
    // - Provider.of<T>(context)란, 특정 타입(T)의 상태를 가져오기 위한 메서드
    // - 해당 타입 값의 상태가 변경되면, 이 구독된 위젯은 다시 빌드!

    // 🖐🏻 현재 (context)로 접근하는데, 어떻게 부모 위젯인 MyApp의 data를 받아올 수 있나?
    // - BuildContext는, Level3가 위젯 트리 내 속한 위치를 나타냄. 여기서 중요한건 바로 '위젯 트리'에 속한다는 것임
    // - 따라서, Provider.of를 활용할 경우, [⭐위젯 트리 내에서 가장 가까운 Provider⭐]를 찾게 됨 -> 즉, 가장 가까운 MyApp에서 선언한 data값을 받아올 수 있음
    return Text(Provider.of<String>(context));
  }
}
