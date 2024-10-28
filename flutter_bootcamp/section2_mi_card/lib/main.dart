import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

// stateless (상태 비 저장 위젯)
// 'STL'만 입력하면, 아래와 같이 위젯을 생성하기 위한 Class 틀이 자동으로 생성됨

class MyApp extends StatelessWidget {

  @override
  // 새로운 위젯을 만들 때 마다, build 함수가 override 되며, 이는 Widget 타입을 리턴하게 됨
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 현재 반환하는 위젯을 '상태 비 저장 위젯', 즉 정적인 위젯으로 설정한 후 Hot Reload ⚡️ 버튼을 누르면 변경사항이 실시간으로 적용됨
        // 단축키 : [cmd+s]
        // 상태값이 존재하는, 예를 들어 Count를 증가시킨 특정 변수값은 hot reload에 의해 초기화 되지 않음.
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white70,
          title: Text("Mi Card"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white70,
        body: Container(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[200],
          onPressed: () {
            print('hello!');
          },
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
