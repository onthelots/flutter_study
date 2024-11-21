import 'package:firebase/components/round_button.dart';
import 'package:firebase/constants.dart';
import 'package:firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String identifier = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  // instance
  // ✅ Firebase Auth instance 생성
  final _auth = firebase_auth.FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🟢 ModalProgressHUD Widget 추가 (Scaffold body로 할당할 것)
      body: ModalProgressHUD(
        inAsyncCall: this.showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                // 🟢 keyboardType : 해당 키보드의 타입. TextInputType으로 접근
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    this.email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email')),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  // 🟢 obsecureText : 비밀번호 등에 사용되는 암호 문자열을 나타냄 (boolean)
                  obscureText: true,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    this.password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password')),
              SizedBox(
                height: 24.0,
              ),

              // register
              RoundButton(
                color: Colors.blueAccent,
                callbackAction: () async {
                  setState(() {
                    this.showSpinner = true;
                  });
                  // 🟢 UserCredential 생성
                  // 비동기로 처리되기 때문에, awiit 키워드를 할당할 것
                  // 또한, 서버에 할당하는 과정이기 때문에, '에러 핸들링'이 반드시 필요함
                  // try-catch 구문으로 진행할 것
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: this.email, password: this.password);

                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.identifier); // 유효할 경우, ChatScreen으로 넘어갈 것
                      setState(() {
                        this.showSpinner = false;
                      });
                    }
                  } catch (error) {
                    print('Registeration Error : $error');
                  }
                },
                text: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
