import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// DicePage
class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ✅ Flutter Outline : Layout을 보다 쉽게 자동으로 완성시켜 주는 Tool
    // 오른쪽 끝에 있는 버튼 중, [Flutter Outline]을 누르게 되면 현재 tree가 나오며
    // 변환하고자 하는 레이아웃의 위젯을 클릭한 후 -> 상단에 버튼을 누르면 자동으로 코드가 변경됨
    // Center, Padding, Row, Column, Wrap Container 등

    return Center(
      // Padding Widget으로 감싸고..
      child: Row(
        children: [
          // ✅ Expanded Widget : Flexible Layout을 만들어 주는 유용한 위젯
          // 단일 위젯이며, 이는 Row 혹은 Column 등 현재 속한 레이아웃에 따라 최대 너비를 채울 수 있게 함
          // 만약에 이미지 기본 크기가 너무 클 경우에 사용할 수 있음!
          // Row라면, 가로인 행의 크기에 맞춰서 현재 children widget의 너비를 맞추고,
          // Columnd이라면 세로, 열의 높이에 맞춤
          Expanded(

              // ✅ flex : Expanded 된 위젯간의 비율 (expaded 위젯은 기본적으로 flex값이 1로 되어있음)
              // 1:1이면 동일한 크기일꺼고, 1:2면 그 다음 위젯이 2배로, 이전 위젯은 1/2 크기가 됨
              // flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice1.png'),
              )
          ),

          // 📌 해당 위젯에 대한 옵션을 보려면? [option + Enter]
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice2.png'),
              )
          ),
        ],
      ),
    );
  }
}
