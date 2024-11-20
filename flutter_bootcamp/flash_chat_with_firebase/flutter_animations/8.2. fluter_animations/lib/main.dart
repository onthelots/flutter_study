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
