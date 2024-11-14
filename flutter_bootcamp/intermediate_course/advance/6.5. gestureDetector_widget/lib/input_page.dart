import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'color_set.dart';

// 💡 관련 소스코드로 이동하기 ( cmd + b)

const double bottomContainerHeight = 80.0;

// 🔴 InputPage (stful)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // ✅ Ternary Operator 활용을 위한 리팩토링
  // 초기값을 설정하지 않을 것이기 때문에, #Nullable# 하도록 optioanl 한 변수로 설정하자 -> false
  Gender? selectedGender;

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

                // ✅ GestureDetector
                // 일반 버튼보다, 더 많은 옵션을 제공 (길게 누르기, 드래그 하기 등..)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      // 📌 초기값이 nullable한 상태이기 때문에, 무조건 -> 처음에는 false로 할당됨
                      boxColor: selectedGender == Gender.male ? AppColors.activeCard.color : AppColors.inactiveCard.color,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        this.selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      // 📌 초기값이 nullable한 상태이기 때문에, 무조건 -> 처음에는 false로 할당됨
                      boxColor: selectedGender == Gender.female ? AppColors.activeCard.color : AppColors.inactiveCard.color,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(boxColor: AppColors.activeCard.color),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(boxColor: AppColors.activeCard.color),
                ),
                Expanded(
                  child: ReusableCard(boxColor: AppColors.activeCard.color),
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
