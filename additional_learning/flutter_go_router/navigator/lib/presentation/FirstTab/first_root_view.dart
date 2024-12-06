import 'package:flutter/material.dart';
import 'package:navigator/routes.dart';

class FirstRootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Root View')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.firstDetail); // Routes.firstDetail로 경로를 명시적으로 사용
          },
          child: Text('Go to First Detail View'),
        ),
      ),
    );
  }
}
