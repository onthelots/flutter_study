import 'package:flutter/material.dart';
import 'first_root_view.dart';
import 'package:navigator/routes.dart';
import 'first_detail_view.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      /// onGenerateRoute : Navigator에 의해, 경로 이동을 위한 콜백 함수. 즉 '어떤 화면을 반환할 지 정의'하는 함수
      /*
       ✅ routes 방식과 onGenerateRoute의 차이
       - routes는 '정적'인 경로이므로, 특정 경로(화면)을 요청되면 무조건 해당 경로로만 반환됨
       - 다만, onGenerateRoute의 경우, '동적' 경로이므로, 동일한 pushNamed임에도 불구하고, 다른 디자인, 화면을 보여줄 수 있음
       */
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.firstRoot:
            return MaterialPageRoute(builder: (_) => FirstRootView());
          case Routes.firstDetail:
            return MaterialPageRoute(builder: (_) => FirstDetailView());
          default:
            return null;
        }
      },
      initialRoute: Routes.firstRoot,
    );
  }
}