import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/chat_screen.dart';

// ✅ 초기화 함수 할당을 위한 import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // 🟢 시스템 테마로 설정할 것
      themeMode: ThemeMode.system,  // 시스템 테마에 맞게 자동으로 변경
      // 라이트 모드 테마
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.black54),
          bodyMedium: TextStyle(fontSize: 15.0, color: Colors.black54),
        ),
      ),

      // 다크 모드 테마
      darkTheme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.white54),
          bodyMedium: TextStyle(fontSize: 15.0, color: Colors.white54),
        ),
      ),
      initialRoute: WelcomeScreen.identifier,
      routes: {
        WelcomeScreen.identifier: (context) => WelcomeScreen(),
        LoginScreen.identifier: (context) => LoginScreen(),
        RegistrationScreen.identifier: (context) => RegistrationScreen(),
        ChatScreen.identifier: (context) => ChatScreen(),
      },
    );
  }
}
