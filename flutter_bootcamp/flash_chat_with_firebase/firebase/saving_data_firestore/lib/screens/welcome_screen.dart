import 'package:firebase/components/round_button.dart';
import 'login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String identifier = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animationController.forward(from: 0.0);
    animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
  }

  // Dispose
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                ),

                // ✅ Text_kit
                // Widget은 AnimatedTextKit이며, child는 animatedTexts (2개 이상일 수 있기 때문)
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              color: Colors.lightBlue,
              callbackAction: () {
                Navigator.pushNamed(context, LoginScreen.identifier);
              },
              text: 'Log in',
            ),

            RoundButton(
              color: Colors.blue,
              callbackAction: () {
                Navigator.pushNamed(context, RegistrationScreen.identifier);
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
