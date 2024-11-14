import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Screen 1',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red
          ),
          child: Text(
              'Go Forwards To Screen 2',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {

            // ✅ Navigator
            // Scaffold에서 하나의 네비게이터를 호출할 수 있음

            // MaterialPageRoute :
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Screen2();
            }));
          },
        ),
      ),
    );
  }
}
