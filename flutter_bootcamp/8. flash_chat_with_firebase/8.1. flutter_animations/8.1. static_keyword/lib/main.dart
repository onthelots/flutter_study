import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),

      // ✅ Named Route
      // 아래와 같이, 임의의 route name을 설정하게 되면, 실수가 발생할 수 있음!
      // 따라서, 각각의 Screen() 내 'identifier' 값을 설정함으로서 잘못 타이핑 되는 경우를 줄이도록 해야 함

      // + ✅ Static : 클래스 내 귀속되어, 해당 building으로 접근 시 모두 동일한 값이 조회됨
      // 이는, 한번만 별도의 메모리 공간에 할당되므로, '인스턴스'화 할 필요가 없음
      // Singleton 패턴에 대해 학습할 것
      initialRoute: WelcomeScreen.identifier,

      // routes -> 'Navigator.pushNamed'로 이동 가능
      routes: {
        WelcomeScreen.identifier : (context) => WelcomeScreen(),
        LoginScreen.identifier : (context) => LoginScreen(),
        RegistrationScreen.identifier : (context) => RegistrationScreen(),
        ChatScreen.identifier: (context) => ChatScreen(),
      },

      // 🟢 참고
      // 만약, 위와 같이 각 Screen별 id를 활용하는것이 아닌,
      // 기존 flutter guide line에서 제공하는 / (슬래시) 형태로 실시할 경우
      // 반드시 '🚫 하나의 Route는, 아무것도 없는 '/' 형태'여야 함
    );
  }
}
