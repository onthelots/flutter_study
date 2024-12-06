import 'package:flutter/material.dart';
import 'presentation/FirstTab/first_tab.dart';
import 'presentation/FirstTab/first_root_view.dart';
import 'presentation/FirstTab/first_detail_view.dart';
import 'presentation/SecondTab/second_tab.dart';
import 'presentation/SecondTab/second_root_view.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation with Nested Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.home, // 앱이 시작될 때 사용될 초기 경로 (MainPage)
      onGenerateRoute: _onGenerateRoute, // onGenerateRoute 설정
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => MainPage());
      case Routes.firstRoot:
        return MaterialPageRoute(builder: (_) => FirstRootView());
      case Routes.firstDetail:
        return MaterialPageRoute(builder: (_) => FirstDetailView());
      case Routes.secondRoot:
        return MaterialPageRoute(builder: (_) => SecondRootView());
      default:
        return null; // 경로가 정의되지 않은 경우 null 반환
    }
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [FirstRootView(), SecondRootView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// IndexedStack : 위젯 겹치기. 특정 인덱스에 해당하는 위젯(현재는 하단의 items)만 화면에 표시할 수 있도록 함
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'FirstTab'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'SecondTab'),
        ],
      ),
    );
  }
}