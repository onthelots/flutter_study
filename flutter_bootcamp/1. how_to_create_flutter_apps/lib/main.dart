import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('I am Rich'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Center(

        // 🟢 Image (asset) 추가
        // pubspec.yaml에서 assets 경로를 추가시켜야만 Dependencies를 획득하여 아래와 같이 사용할 수 있음
        child: Image(image: AssetImage('images/moneytree.png')),
      ),
    ),
  ));
}


// 🟢 app icon 변경하기
// - android
// app > src > main > res > mipmap-hdpi 관련 파일을 모두 대체하거나
// 직접 android 프로젝트로 가서 변경할 수 있음(사이즈 변경 가능, 이미지 경로설정 필요)

// - iOS
// ios > Runner > Assets.xcassets > AppIcon.appiconset 폴더를 통째로 대체함
// 혹은, XCode 프로젝트 파일을 열어서 직접 변경할 수 있음