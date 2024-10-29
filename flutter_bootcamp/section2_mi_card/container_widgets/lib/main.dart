import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

// 🟢 stateless (상태 비 저장 위젯)
// 'STL'만 입력하면, 아래와 같이 위젯을 생성하기 위한 Class 틀이 자동으로 생성됨
// 이는, [Hot Reload]시에 즉각 반영되는 사항임 (만약 'Stateful', 즉 상태값이 변경되는 위젯일 경우에는 Hot Reload를 해도 반영되지 않음)

class MyApp extends StatelessWidget {

  @override
  // 🟢 새로운 위젯을 만들 때 마다, build 함수가 override 되며, 이는 Widget 타입을 리턴하게 됨
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 현재 반환하는 위젯을 '상태 비 저장 위젯', 즉 정적인 위젯으로 설정한 후 Hot Reload ⚡️ 버튼을 누르면 변경사항이 실시간으로 적용됨
        // 단축키 : [cmd+s]
        // 상태값이 존재하는, 예를 들어 Count를 증가시킨 특정 변수값은 hot reload에 의해 초기화 되지 않음
        backgroundColor: Colors.teal,

        // 🟢 Layout Widget
        // - 1. Container
        // Container는 별도의 레이아웃 child를 가지지 않는 이상, home의 전체 화면 범위를 차지하게 됨.
        // home의 background 색상을 'teal'로 설정한 후, body에 Container를 할당, Container의 color를 'white'로 변경하면? > 전체 화면이 'white'로 설정됨

        // - 2. Safe Area
        // 만약, home>body를 처음부터 Container()로 설정하게 되면, 상단의 시간과 상태를 나타내는 'Status Bar'를 고려하지 않고 디바이스 전체 화면을 차지하는 불상사가 발생함
        // 따라서, iPhone과 동일하게 Safe Area를 설정할 필요가 있으며, 이 또한 하나의 Widget이므로 body를 SafeArea로 감싸고 그 내부 child에 Container를 할당함.
        // [option+Enter]를 누르면, 옵션을 선택할 수 있음.

        // - 3. Flutter Inspector
        // Layout의 형태를 디바이스 inspector를 통해 시각적으로 확인할 수 있음
        // 📌 주의사항 : 만약에 높이, 너비가 100인 Container가 있을 때, 마진을 설정하게 되면 실제 inspector상에는 높이와 너비에 더한 값으로 범위가 표시됨
        body: SafeArea(
          child: Container(
            height: 100.0, // 높이 (고정)
            width: 100.0, // 너비 (고정)

            // - 4. Margin (위젯 바깥쪽 / 외부 여백)
            // margin: EdgeInsets.all(20.0), // 전체 마진
            // margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0), // 마진 커스텀 설정 1 (vertical, horizontal) - symmetric
            // margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0), // 마진 커스텀 설정 2 (Left,Top,Right,Bottom) - fromLTRB
            // margin: EdgeInsets.only(left: 30.0), // 마진 커스텀 설정 3 (left, right 등) - only

            // - 5. Padding (위젯 안쪽 / 내부 여백)
            // Margin과 동일하게 EdgeInsets 옵션을 사용함
            // padding: EdgeInsets.all(20.0),
            color: Colors.white,
          
            // 만약, child에 Text를 할당하게 되면? > Text, 폰트 크기에 따라 Container의 크기가 변경됨! (즉, Child의 크기에 따라 Container의 크기도 자동으로 변경됨)
            // Containers with children size themselves to their children.
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }
}
