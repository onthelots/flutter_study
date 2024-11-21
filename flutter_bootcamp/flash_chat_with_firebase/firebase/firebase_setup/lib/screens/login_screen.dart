import 'package:firebase/components/round_button.dart';
import 'package:firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase/constants.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ firebase_auth import
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String identifier = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // instance
  // ✅ Firebase Auth instance 생성
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: this.showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                // 🟢 keyboardType : 해당 키보드의 타입. TextInputType으로 접근
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  this.email = value;
                },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                // 🟢 obsecureText : 비밀번호 등에 사용되는 암호 문자열을 나타냄 (boolean)
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  this.password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                color: Colors.blueAccent,
                callbackAction: () async {

                  setState(() {
                    this.showSpinner = true;
                  });

                  // 🟢 Login
                  try {
                    UserCredential loginUser = await _auth.signInWithEmailAndPassword(email: this.email, password: this.password);

                    if (loginUser != null) {
                      setState(() {
                        this.showSpinner = false;
                      });

                      Navigator.pushNamed(context, ChatScreen.identifier);
                    }
                  } catch (error){
                    print('Log-in Error : $error');
                  }
                },
                text: 'Log in',
              )
            ],
          ),
        ),
      ),
    );
  }
}
