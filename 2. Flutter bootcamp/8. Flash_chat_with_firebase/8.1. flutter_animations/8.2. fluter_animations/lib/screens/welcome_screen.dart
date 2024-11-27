import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {

  // Named Routes
  static const String identifier = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            // ✅ Hero Animation
            // A -> B 스크린 이동 시, 특정 위젯이 이동하는 애니메이션
            // 다음과 같이 3가지의 종류가 필요함
            // 1) 2 Hero Widgets
            // 2) A Shared Tag Property
            // 3) Navigator-based Screen Transitions

            
            Row(
              children: <Widget>[

                // 🟢 1) Hero Widget
                Hero(

                  // 🟢 2) Shared Tag (start) -> Another Screen Hero Widget
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),

                Text(
                  'Flash Chat',
                  style: TextStyle(
                    color: Colors.yellow[800],
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    // 🟢 3) Navigator-based Screen Transitions
                    Navigator.pushNamed(context, LoginScreen.identifier);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    // 🟢 3) Navigator-based Screen Transitions
                    Navigator.pushNamed(context, RegistrationScreen.identifier);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
