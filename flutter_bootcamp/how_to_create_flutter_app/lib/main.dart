import 'package:flutter/material.dart';

void main() {
  // First Widget (Material App)
  // 중앙에 Text를 정렬하기 위해, Material 앱과 Text 사이에 [Center Widget]을 추가해보자.
  // 정렬을 위해, 줄바꿈이 필요한 곳에 쉼표(,)를 넣고, 오른쪽 버튼을 눌러 'Reformat code'(cmd+option+L)를 누르면 자동으로 정렬이 된다.
  runApp(
    MaterialApp(
      // Scaffold : 디바이스의 전체 배경 부분.
      home: Scaffold(
        // backgroundColor : 배경색. 여기서는 스캐폴드의 배경
          backgroundColor: Colors.blueGrey,

          // appBar : 앱 상단부분에 나타낼, 말 그대로 앱 바
          appBar: AppBar(
            title: Text("I Am Rich"),
            backgroundColor: Colors.blueGrey[900],
          ),

          // body : appBar 권역을 제외한 나머지 범위
          // 📌 Tips : Image를 클릭하고 (option)버튼을 누르면, 해당 줄에 💡 모양이 나타나는데, 여기서 다양한 옵션을 살펴볼 수 있음
          // Image -> Center widget, Wrap Column, Wrap Container...

          // 'Center Widget'을 옵션으로 선택할 경우, 자동으로 Center 위젯 내 [child]로 해당 Image가 포함됨
          body: Center(
            child: Image(
              // AssetImage는 pubspec.yaml에서 직접 디렉토리(파일)를 적어서 사용할 수 있음.
              image: AssetImage('images/diamond.png'),
            ),
          )
      ),
    ),
  );
}

