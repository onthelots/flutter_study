import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

// 🟢 BMICalculator (stl)
// 🚫 강의 시점에서 사용하는 프로퍼티는 대부분 deprecated 되었기 때문에, 별도로 레퍼런스&문서를 찾아 활용할 것 🚫
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //
      //   // ✅ Color Theme
      //   // Hex코드를 기반으로, 16진수를 앞에 할당해야 함 (0xff+Hex)
      //   scaffoldBackgroundColor: Color(0xff0B1033),
      //
      //   // ✅ Text Theme
      //   // 아래와 같이, header, body 등 각각의 TextStyle을 지정한 후,
      //   // Text가 할당되는 곳에서 Theme.of(context).textTheme.(여기에 지정하고자 하는 TextStyle 작성)을 반드시 작성해야 함
      //   textTheme: TextTheme(
      //     bodyLarge: TextStyle(
      //       color: Colors.white, // 텍스트 색상
      //       fontSize: 18,        // 폰트 크기
      //     ),
      //   ),
      // ),

      // ✅ CopyWith (https://terry1213.com/flutter/flutter-copywith/)
      // 원본 객체, 즉 Class의 속성을 변경하지 않고 '특정 값'만을 변경한 -> 새로운 객체를 반환하기 위함
      // 이는, 흔히 사용한 Class의 [Constructor]의 역할과 동일하다고 보면 됨.
      // 여기서도 'copyWith'이란 초기값 메서드를 활용함으로서 -필요한 부분- 만 변경할 수 있도록 함

      // 👉🏻 예시 1: 다크모드에서, copyWith을 통해 bodySmall Text의 색상만 변경
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodySmall:  TextStyle(
      //       color: Colors.white
      //     )
      //   )
      // ),

      // 👉🏻 예시 2 : 라이트 모드에서, copyWith을 활용하여 floatingButton의 테마 색상을 설정
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xffFF0067),
          foregroundColor: Colors.white
        )
      ),

      home: InputPage(),
    );
  }
}