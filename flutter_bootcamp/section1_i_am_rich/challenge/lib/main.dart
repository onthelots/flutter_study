import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text("I Am Rich"),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Image(image: AssetImage('images/moneygrow.png'),
          )
        ),
      ),
    ),
  );
}
