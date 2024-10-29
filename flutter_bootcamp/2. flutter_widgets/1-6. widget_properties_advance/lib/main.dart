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
            mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙정렬
            children: [
              CircleAvatar(
                radius: 50.0, // 반경 (크기)
                foregroundImage: AssetImage('images/avatar_image.jpeg'),
              ),

              // 🟢 Text 1
              Text(
                'Onthelots',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
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

              // 🟢 Card Widget
              // card의 경우, corner radius가 자연스럽게 들어가 있는 위젯
              // 다만, 내부 요소 padding 옵션이 존재하지 않는데..

              // 💭 [Padding Class] 자체가 [Card의 하위 클래스]이므로, Padding을 Card의 [child]로 할당한 후 > 내부에 컨텐츠를 넣어주자!
              SizedBox(
                height: 20.0,
                width: 150.0,
                // 🟢 Divier (분리선)
                // 간단하게 1px 두께의 분리선을 할당할 수 있음
                child: Divider(
                  color: Colors.white,
                ),
              ),

              Card (

                // 🔴 Card Options
                color: Colors.white,
                elevation: 2.0,
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10.0
                ),

                // 🟢 Padding Class (child)
                child: Padding(
                  padding: EdgeInsets.all(0.0), // padding 클래스의 옵션을 설정할 수 있음
                  // Row는 10.0 pt의 패딩 내부에 존재하게 됨

                  // 🟢 ListTile (아이콘 + 카드)
                  // 즉, Row 자체를 대체할 수 있는 방식
                  child: ListTile(

                    //leading : 가장 왼쪽에 위치하는
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),

                    // title : leading에 이은 Text
                    title: Text(
                      '+82 123 456 789',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'Roboto',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              // 🟢 Container 2 (이메일)
              Card(
                // padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                elevation: 2.0,
                // ListTile 자체가 이미 패딩값이 존재하므로, 별도의 설정이 필요하지 않다면 위 Card 1과 같이 Padding>ListTile이 아닌, 그냥 ListTile을 Card의 child로 활용하자.
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                    'Jhyim1992@gmail.com',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}