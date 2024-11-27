import 'package:bmi_calculator/Constant/text_set.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'Constant/color_set.dart';
import 'Constant/constants.dart';

// 💡 관련 소스코드로 이동하기 ( cmd + b)

// 🔴 InputPage (stful)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // property
  // - 1) selectedGender
  Gender? selectedGender;
  int height = 180;

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
          isActive: selectedGender == gender
              ? true
              : false
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
        crossAxisAlignment: CrossAxisAlignment.stretch, // CrossAxis (가로) 형태 설정
        children: [

          // 🟡 GestureDetector > ReusableCard > buildGenderCard(method)
          Expanded(
            child: Row(
              children: [

                // 🟢 buildGenderCard 함수 호출로 중복 제거
                buildGenderCard(Gender.male, FontAwesomeIcons.mars, 'MALE'),
                buildGenderCard(Gender.female, FontAwesomeIcons.venus, 'FEMALE'),
              ],
            ),
          ),

          // 🟡 Height Slider
          Expanded(
            child: ReusableCard(
              boxColor: AppColors.activeCard.color,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    //✅ Baseline
                    // 반드시, 기준인 Baseline 속성을 추가해야 함
                    crossAxisAlignment: CrossAxisAlignment.baseline,

                    // TextBaseline : alphabetic (일반적인 문자에 활용)
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberLabelTextStyle,
                      ),

                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],

                  ),

                  // ✅ Slider
                  // - value (사용자가 선택한 값)
                  // - onChanged (변경이 되었을 때, 현재 선택된 값에 대한 정보를 어떻게 다룰 것인지 정의)

                  // ✅ SliderTheme
                  // - Slider Widget을 그냥 사용할 경우, 다룰 수 있는 속성이 많지 않음
                  // 따라서, SliderTheme Widget으로 감싼 후, data를 역시나 모든 속성에 접근할 수 있는 copyWith을 통해 가져옴

                  // 👉🏻 만약, 여기서 사용하는게 부담스럽다면, 별도의 ThemeData로 옮길 수 있음
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0
                      ),

                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),

                      thumbColor: AppColors.button.color,
                      overlayColor: AppColors.button.color.withOpacity(0.2),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: AppColors.inactiveCard.color,
                      trackHeight: 2.0,
                    ),
                    child: Slider(
                      // - 기본 속성
                      value: height.toDouble(),
                      min: 120.0, // 최소값
                      max: 220.0, // 최대값
                      // - 변경값 설정
                      onChanged: (newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🟡 Weight & Age
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
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}