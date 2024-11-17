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
  // property
  // - 1) selectedGender
  Gender? selectedGender;

  // ✅ 1급 객체 특징을 활용, 특정 Widget의 형태를 반환하는 함수로 만들어보자
  // 👉🏻 resuable_card.dart 참고

  // ✅ GenderCard를 생성하는 함수를 추가하여, 더 가독성 있게 만들 수 있음

  // method

  // - buildGenderCard
  Widget buildGenderCard(Gender gender, IconData icon, String label) {
    return Expanded(
      child: ReusableCard(
        boxColor: selectedGender == gender
            ? AppColors.activeCard.color
            : AppColors.inactiveCard.color,
        cardChild: IconContent(
          icon: icon,
          label: label,
        ),
        onPress: () {
          setState(() {
            selectedGender = gender;
          });
        },
      ),
    );
  }

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

                // 🟢 buildGenderCard 함수 호출로 중복 제거
                buildGenderCard(Gender.male, FontAwesomeIcons.mars, 'MALE'),
                buildGenderCard(Gender.female, FontAwesomeIcons.venus, 'FEMALE'),
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