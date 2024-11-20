import 'package:flash_chat/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

// ✅ Custom Animation
// 원하는 방식대로 애니메이션을 구현하고자 한다면, 아래와 같은 3가지 요소가 필요
/*
1) A Ticker : 마치 플립북. 시간에 따라 애니메이션이 변경되는 사항을 트리거하며 -> 이를 스크린에 랜더링
2) Animation Controller : start, stop, lookback 등 전반적인 사항을 관리
3) An Animation Value : 0-1으로 보통 이동. 높이, 크기, 색상, 알파값 등을 설정할 수 있음
 */

class WelcomeScreen extends StatefulWidget {
  static const String identifier = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// // 🟢 1) A Ticker
// 👉🏻 Mixin (SingleTickerProviderStateMixin Class) - 1개의 애니메이션만 작동할 것 (single)
class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  // 🟢 2) Animation Controller
  late AnimationController animationController;

  // 🔴 Curve animation
  late Animation animation;

  @override
  void initState() {
    super.initState();

    // 2-1) AnimationController 초기화
    // 🟢 vsync : 애니메이션 타이밍을 동기화 하는 역할. 화면이 그려지는 타이밍에 맞춰서 애니메이션을 실행하며, 만약 화면이 사라졌다면 애니메이션을 멈춰 불 필요한 작업을 방지함
    // 여기서, vsync는 SingleTickerProvider가 제공하게 됨.
    animationController = AnimationController(
      vsync: this,

      // 🟢 duration : 애니메이션의 총 지속시간 (즉, 애니메이션의 시작-끝까지 소요되는 시간)
      // 길면 애니메이션이 느리게 진행되고, 짧으면 빠르게 진행
      duration: Duration(seconds: 1),
      // upperBound: 1.0,
    );

    // 🔴 CurvedAnimation init
    // 참고(https://api.flutter.dev/flutter/animation/Curves-class.html)
    // upperBound는 반드시 1보다 클 수 없음.
    // 따라서, height: animation.value * 100 와 같이, value값에 곱셈을 통해 애니메이션 크기를 설정해야 함
    // animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    // 2-2) 애니메이션 시작
    // 🟢 forward : 애니메이션을 순 방향으로 시작! (from value to 1)
    animationController.forward(from: 0.0);

    // 🟢 reverse : 애니메이션을 역방향으로 동작하도록 함 (from value to 0)
    // animationController.reverse(from: 1.0);

    // 🟢 ColorTween
    animation = ColorTween(begin: Colors.grey, end: Colors.white).animate(animationController);

    // 2-3) 상태 변경에 따른 Listener
    // 🟢 addListener : AnimationController의 상태가 변경될 때마다 특정 코드를 실행하도록 설정
    animationController.addListener(() {

      // 🟢 value : 결정적으로, 애니메이션이 실행되는 시간에 대한 값을 0-1 나타냄
      // print(animation.value);

      // 👉🏻 반드시, 여기서 setState 메서드를 통해 Stateful 하도록, 화면을 다시 그리도록 요청해야 함
      setState(() {});
    });

    // 2-4) 애니메이션의 상태를 감지하는 Listener
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // animationController.reverse(from: 1.0); // 완료된 상황에서, 다시 reverse 애니메이션을 실행시킬 수도 있음
      } else if (status == AnimationStatus.dismissed) {
        // animationController.forward(); // 완료된 상황. 즉 Status가 존재하지 않는 상황에서 다시 forward()를 실시할 수도 있음
      }
    });
  }

  // ✅ Dispose (메모리 누수 방지 및 리소스 해제)
  // 현재 화면에서 Animation Controller가 계속 메모리상에 남아있기 때문에, 위젯이 파괴될 경우 메모리 상에서 해제해야 함
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
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),

                Text(
                  'Flash Chat',
                  style: TextStyle(
                    color: Colors.yellow[800],
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.identifier);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.identifier);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
