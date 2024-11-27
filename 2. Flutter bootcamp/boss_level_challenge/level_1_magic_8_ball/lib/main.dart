import 'package:flutter/material.dart';
import 'dart:math';

// main
void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    )
  );
}

// BallPage (stateless)
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold Options
      backgroundColor: Colors.blue,

      // appBar
      appBar: AppBar(
        backgroundColor: Colors.blue[900],

        // text, title
        centerTitle: false,
        title: Text('Ask Me Anything'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),

      // body
      body: Ball()
    );
  }
}

// Ball (stateful)
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1; // ball int

  void randomBallNumber() {
    this.ballNumber = Random().nextInt(5) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () {

            // ballNumber Random integer method
            setState(() {
              randomBallNumber();
            });
          },
          child: Image(image: AssetImage('images/ball${this.ballNumber}.png')),
        ),
      ),
    );
  }
}
