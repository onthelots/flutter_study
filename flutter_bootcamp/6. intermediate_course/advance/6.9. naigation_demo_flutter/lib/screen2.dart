import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Screen 2',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue
          ),
          child: Text(
            'Go Back To Screen 1',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // ✅ 되돌아가기 - POP
            // 현재 context를 스택에서 pop, 즉 지우는 행위를 의미
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
