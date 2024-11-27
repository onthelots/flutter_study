import 'package:flutter/material.dart';

// 🔴 InputPage (stful)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
        child: Text(
          'Body Text',

          // ✅ CopyWith을 활용한 ThemeData 설정
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),

      // ✅ 특정 Widget의 Theme을 설정할 때는?

      // 1) MaterialApp에 설정된 ThemeData를 context에서 설정한 테마로 하고싶다?
      // 👉🏻 그냥 그대로 쓰면 됨
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),

      // 2) MaterialApp ThemeData가 아닌, 별도로 지정하고 싶다?
      // - 일단, 'Theme' 위젯으로 감싸고
      // - copyWith을 통해 특정 프로퍼티, 속성만 별도로 설정하면 됨

      // floatingActionButton: Theme(
      //   data: Theme.of(context).copyWith(
      //     floatingActionButtonTheme: FloatingActionButtonThemeData(
      //       backgroundColor: Colors.green,
      //       foregroundColor: Colors.white,
      //     ),
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
