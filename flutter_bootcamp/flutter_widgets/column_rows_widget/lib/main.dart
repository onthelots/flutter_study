import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Scaffold options
        backgroundColor: Colors.teal,

        // body

        // ✅ Multi-child layout widgets
        // 2개 이상의 Widgets, 요소를 레이아웃을 할당하는 방식
        // https://beomseok95.tistory.com/310 참고
        // https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e (실습)

        body: SafeArea(
          // - child로 Column(열, 수직 리스트) 형식을 할당
          // - 물론, row로 변경하여 사용도 가능함
          child: Column(

            // 🟢 mainAxisSize (주축 - 세로 기준)
            // Column은 수직방향으로 모든 요소들이 할당되는 범위를 가지고 있으나,
            // mainAxisSize를 min으로 설정할 경우 요소의 최대 사이즈로 재 설정됨 (기본값은 max)
            // mainAxisSize: MainAxisSize.min,

            // 🔴 mainAxisAlignment (1) - 요소의 정렬
            mainAxisAlignment: MainAxisAlignment.start,
            // start(상단)
            // center(중앙)
            // end(하단) 정렬이 가능함

            // space ( Evenly, Around, Between)
            // evenly : child widget 사이 공간을 모두 균등하게 배분
            // Between: child widget을 시작과 끝에 배치, 사이의 나머지 child widget을 배치 (균등하게)
            // spaceAround: 첫 번째와 마지막 child의 앞,뒤 여유공간을 나머지 child간 공간의 1/2만큼 배치

            // 🔴 verticalDirection (2) - 요소의 순서
            // down은 내림차순 (코드 순서 그대로)
            // up은 오름차순 (코드 역순으로)

            // 만약, mainAxisSize가 max(default)일 경우, up(오름차순)으로 변경할 경우 하단에서 부터 쌓이게 되며
            // mainAxisSize가 min일 경우에는 요소 크기에 맞춰지므로 up(오름차순)일 경우에도 상단에서 순서만 바뀌게 됨 (test 해볼 것)
            // verticalDirection: VerticalDirection.up,

            // 🟡 crossAxisAlignment (주축 - 가로 기준)
            // start : 왼쪽 정렬
            // center : 중앙 정렬
            // end : 오른쪽 정렬
            // stretch : 전체 채우기. 즉 각 children의 요소 width를 화면 전체 너비만큼 채우게 됨

            // 🚫 Column일 경우, children의 크기(너비)가 모두 동일하다면 crossAxisAlignment는 작동하지 않음.
            // 왜? 해당 Column의 크기(너비)는 요소의 너비값과 동일하니까.
            // -> 만약 crossAxisAlignment.end를 통해 모든 요소를 오른쪽에 정렬하고자 한다면, 화면 전체 크기의 children을 하나 추가하는 방법이 있음
            // width: double.infinity
            crossAxisAlignment: CrossAxisAlignment.stretch,

            // - Column의 요소는 'children'으로 할당
            children: [
              // - 내부에 Container 1을 추가
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.white,
                child: Text('Container 1'),
              ),

              // 🟡 sizebox (임의의 children container)
              SizedBox(
                height: 20.0,
              ),

              // - 내부에 Container 2을 추가
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: Text('Container 2'),
              ),

              // - 내부에 Container 3을 추가
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
                child: Text('Container 3'),
              ),

              // - 너비가 화면 전체 너비인 Container 추가
              // Container(
              //   width: double.infinity,
              //   height: 40.0,
              //   color: Colors.red,
              // )
            ],
          ),
        ),
      ),
    );
  }
}