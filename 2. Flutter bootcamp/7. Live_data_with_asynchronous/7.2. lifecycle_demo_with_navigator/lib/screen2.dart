import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  // ✅ LifeCycle (Widget)
  // initState -> build -> deactivate


  // 👉🏻 1) initState()
  // Called when this object is inserted into the tree.
  // 즉, 위젯이 생성될 때 즉시 호출되는 상태값
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState Called');
  }

  // 👉🏻 3) Deactivate
  // 현재 Widget이 사라질 시, 호출되는 상태값
  // 즉, Widget이 파괴됨
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate Called');
  }

  @override
  Widget build(BuildContext context) {

    // 👉🏻 2) Build
    // 실제 위젯이 빌드 되었을 때, 나타나는 하단의 위젯 상태
    print('build Called');

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
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
