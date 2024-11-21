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
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.identifier,
      routes: {
        WelcomeScreen.identifier : (context) => WelcomeScreen(),
        LoginScreen.identifier : (context) => LoginScreen(),
        RegistrationScreen.identifier : (context) => RegistrationScreen(),
        ChatScreen.identifier: (context) => ChatScreen(),
      },
    );
  }
}
