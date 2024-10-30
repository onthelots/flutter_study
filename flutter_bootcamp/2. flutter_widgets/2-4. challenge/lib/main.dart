import 'package:flutter/material.dart';

void main() {
  runApp(LayoutChallenge());
}

class LayoutChallenge extends StatelessWidget {
  const LayoutChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // options
        backgroundColor: Colors.teal,

        // safeArea 설정
        body: SafeArea(child:
            Row(
              mainAxisSize: MainAxisSize.max, // 화면 최대 크기에 맞춤
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spaceBetween : 요소 끝 정렬 + 사이 space
              // spaceAround : 요소 끝 패딩 + 사이 space
              // spaceEvenly : 이븐하게 요소별로 모두 동일한 space

              children: [
                // children 1: Red Container
                Container(
                  color: Colors.red,
                  width: 100.0,
                ),

                // children 2:
                Column(
                  mainAxisSize: MainAxisSize.min, // 요소크기에 맞춤
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                  children: [
                    Container(
                      color: Colors.yellow,
                      width: 100.0,
                      height: 100.0,
                    ),

                    Container(
                      color: Colors.green,
                      width: 100.0,
                      height: 100.0,
                    ),
                  ],
                ),

                // children 1: Red Container
                Container(
                  color: Colors.blue,
                  width: 100.0,
                ),
              ],
            )
        ),
      ),
    );
  }
}
