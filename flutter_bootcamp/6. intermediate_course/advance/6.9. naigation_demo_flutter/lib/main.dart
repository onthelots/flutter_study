import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen0.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

// https://docs.flutter.dev/cookbook/navigation/navigation-basics 참고
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TargetPlatform을 설정, 동일한 성격의 Navigation 효과를 얻을 수 있음

      // ✅ TargetPlatform
      theme: ThemeData(platform: TargetPlatform.iOS),

      // ✅ initalRoute
      // 처음 빌드할 화면, 즉 첫 번째 Route를 아래와 같이 named route를 통해 설정할 수 있음
      // named를 실시할 때는 반드시 이름 앞에 /를 붙여줘야 함

      // home: Screen0(),
      initialRoute: '/screen0',

      // ✅ routes
      // map <String, build function> 형식
      // 각각의 '이름'과 Screen(Widget)을 반환함
      routes: {
        '/screen0': (context) => Screen0(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
      },
    );
  }
}
