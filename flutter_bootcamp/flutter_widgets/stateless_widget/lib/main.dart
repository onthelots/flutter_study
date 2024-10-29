import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


// 🟢 Stateless Widget (정적 위젯)
// 상태값이 변화되지 않는 위젯을 의미함
// 'STL'을 타이핑하면, 자동완성되어 해당 위젯 클래스가 생성됨

// 🔴 Hot Reload (빠른 새로고침)
// 빌드 중, 컴파일 단계에서 정적 위젯의 옵션이 변경될 경우, 빠르게 변경사항을 확인할 수 있음 (번개 표시)

// 🔴 Hot Restart (빠른 재 실행)
// Hot Reload가 가능한 Stateless Widgets이 아닌, 상태값이 변화되는 사항 (Stateful)의 경우 빠른 재실행이 필요함


// MARK: - MyApp (Stateless, 즉 정적인 위젯)
class MyApp extends StatelessWidget {

  // StatelessWidget 클래스 -> build 메서드를 override함으로서 내부에 관련 위젯을 구성함 (return Widget 타입)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(

          // 아래와 같이 Container의 색상을 [Hot Reload]를 통해 빠른 시간 내 변경된 것을 확인할 수 있음
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
