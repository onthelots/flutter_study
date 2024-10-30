import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              // 📌 Tips
              // 특정 Widget을 클릭하고, [ctl+J]를 누르면 관련된 프로퍼티 문서가 나온다.

              // 🟢 CircleAvatar : 원형의 아바타 위젯.
              CircleAvatar(
                radius: 50.0, // 반경 (크기)
                foregroundImage: AssetImage('images/avatar_image.jpeg'),
              ),

              // 🟢 Text 1
              Text(
                'Onthelots',

                // 🔴 TextStyle : Text의 사이즈, 색상, 폰트 등을 변경하기 위해선 style TextStyle 위젯 property를 선언해야 함
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,

                    // 🟢 Custom Font
                    // Assets과 동일한 방식으로, 관련 폴더를 생성한 후 폰트파일(ttf)를 할당, pubspec.yaml에서 추가
                  fontFamily: 'Pacifico'
                ),
              ),

              // 🟢 Text 2
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Colors.teal.shade100, // shade(투명도)
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  letterSpacing: 2.0, // letterSpacing (글자 간격)
                ),
              ),

              // 🟢 Container 1 (연락처)
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 10.0
                ),

                child: Row(
                  children: [
                    // 🔴 Icons (https://api.flutter.dev/flutter/material/Icons-class.html)
                    Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),

                    // 🔴 SizedBox : 간격을 줄때 용이함 (빈 박스)
                    SizedBox(
                      width: 10.0,
                    ),

                    Text(
                      '+82 123 456 789',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),

              // 🟢 Container 2 (이메일)
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10.0
                ),

                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.teal.shade900,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'jhyim1992@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
