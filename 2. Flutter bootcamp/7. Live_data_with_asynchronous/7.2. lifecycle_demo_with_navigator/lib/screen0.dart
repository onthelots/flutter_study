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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                      return Screen1();
                }));
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
