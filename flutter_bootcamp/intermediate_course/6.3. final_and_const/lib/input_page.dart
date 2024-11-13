import 'package:flutter/material.dart';

const double bottomContainerHeight = 80.0;

// enum
enum AppColors {
  appBar,
  background,
  card,
  button
}

// ✅ extension
// 클래스, 열거형 등을 확장할 수 있음
// dart의 경우, extension의 명칭을 설정할 수 있으며, 이는 타 라이브러리나 개별적으로 생성한 확장에 대한 고유한 값으로 작용됨 (충돌 방지)
extension AppColorExtention on AppColors {

  // get -> getter와 동일. 계산된 속성을 반환하는 방식
  // 예를 들어, background 색상을 호출하고자 한다면
  // AppColors.background.(color) -> 여기서 .을 통해 color 게터함수를 호출할 수 있음.
  Color get color {

    // 여기서 this는, AppColors를 의미함
    switch (this) {
      case AppColors.appBar:
        return Color(0xFF111639);
      case AppColors.background:
        return Color(0xFF0B1033);
      case AppColors.card:
        return Color(0xff282B4E);
      case AppColors.button:
        return Color(0xffEB1555);
      default:
        throw UnimplementedError('Color for $this is not implemented.');
    }
  }
}

// 🔴 InputPage (stful)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background.color,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w200),
        backgroundColor: AppColors.appBar.color,
      ),

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(boxColor: AppColors.card.color),
                ),
                Expanded(
                  child: ReusableCard(boxColor: AppColors.card.color),
                ),
              ],
            ),
          ),

          Expanded(
            child: ReusableCard(boxColor: AppColors.card.color),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(boxColor: AppColors.card.color),
                ),
                Expanded(
                  child: ReusableCard(boxColor: AppColors.card.color),
                ),
              ],
            ),
          ),

          Container(
            color: AppColors.button.color,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

// Extract Widget (Stateless Widget)
class ReusableCard extends StatelessWidget {

  // ✅ Final
  // @immutable ? : 불변. 즉 현재 StatelessWidget은 불변하는 상태값을 가지고 있는데,
  // 내부에 변경될 수도 있는 boxColor라는 Color 타입의 프로퍼티가 존재함.

  // 👉🏻 즉, StatelessWidget을 변경하고자 한다면, 이는 기존의 Widget을 없애고, 'New' Widget을 만들어야 한다는 것을 의미함 (이게 사실 불변성의 특징)
  // 따라서, 여기서는 앱이 구동되는 시점인 <런타임>에 결정되는 'final' keyword를 할당하는 것이 맞음

  // ✅ const
  // ReusableCard를 생성할 때마다 boxColor의 값이 달라질 수 있음.
  // boxColor는 앱이 구동된 후에 동적으로 결정되는 값이기 때문에, 컴파일 타임에 값을 알 수 없어서 !! const를 사용할 수 없다 !!
  // 아예 고정적으로 사용하려면, 초기값을 설정하는 수 밖에..

  final Color boxColor;

  ReusableCard({required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0), // margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),
    );
  }
}
