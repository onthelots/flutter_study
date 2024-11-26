import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// ✅ ChangeNotifier
// - 상태 변경 시 자동으로 UI를 업데이트하는 역할
// - 이를 구독한 위젯들은, 해당 값이 변경될 때 마다 Re-build를 실시하게 되며,
// - 상태가 변경될 때 마다 [ notifiyListeners() ] 메서드를 호출해야 함
class Data extends ChangeNotifier {

  // data property
  String data = 'Some data';

  // data change method
  void changeString(String newString) {
    data = newString;
    notifyListeners(); // ⭐ notifiyListeners 메서드 실행을 통해 모든 리스너에게 변경된 사항을 알릴 필요가 있음
  }
}

// ==================== MyApp
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // ✅ ChangeNotifierProvider
    // - ChangeNotifier 객체를 Provider 하기 위해, 아래와 같이 ChangeNotifierProvider 객체를 반환하고,
    // - 반환하고자 하는 타입을 < > 내 할당함
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

// ==================== Level 1
class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

// ==================== Level 2
class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

// 🟢 MyTextField (Level2에 속함)
// 상위 위젯인 - AppBar (ChangeNotifierProvider)
// 하위 위젯인 - Level3
// 모두의 데이터를 변경하고자 함
class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        // ⭐ changeString을 실행함으로서, 전역으로 값이 변경됨을 알림
        // 🚫 중요한점 ! textField의 onChanged와 같은 [이벤트 핸들러]는 UI 리빌드를 유발하지 않아야 함. 그냥 단순히 입력값을 표시하는데 그치기 때문에
        // 따라서, listen 타입을 false로 설정해야 함
        // (기본적으로 listen은 true임)
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

// ==================== Level 3
class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data 타입으로 변경하고, 타입 내 할당하고자 하는 프로퍼티를 선언함
    return Text(Provider.of<Data>(context).data);
  }
}


