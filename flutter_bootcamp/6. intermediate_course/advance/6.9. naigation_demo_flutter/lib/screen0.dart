import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen1.dart';

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Screen 0',
          style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),
              child: Text(
                'Go To Screen 1',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {

                // 1) 일반적으로 MaterialPageRoute를 통해 특정 이동하고자 하는 곳으로 설정하거나
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                      return Screen1();
                }));

                // 2) 설정된 pushNamed을 통해 해당 이동하는 곳을 '이름'을 통해 지정할 수도 있음
                // Navigator.pushNamed(context, '/first');
              },
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
              ),
              child: Text(
                'Go To Screen 2',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, '/screen2');
              },
            ),
          ],
        ),
      ),
    );
  }
}
