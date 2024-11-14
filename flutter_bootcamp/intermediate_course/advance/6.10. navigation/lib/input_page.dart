import 'package:bmi_calculator/Constant/text_set.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constant/gender.dart';
import 'Widgets/reusable_card.dart';
import 'Widgets/icon_content.dart';
import 'Constant/color_set.dart';
import 'Constant/constants.dart';
import 'Widgets/button_round_icon.dart';

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
  int weight = 60;
  int age = 19;

  // method
  // buildGenderCard
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

                  // Label
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),

                  // Height Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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

                  // Slider (Slider Custom Widget)
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
                  child: ReusableCard(
                    boxColor: AppColors.activeCard.color,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),

                        Text(
                          this.weight.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (this.weight > 0) this.weight--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: ReusableCard(
                    boxColor: AppColors.activeCard.color,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),

                        Text(
                          this.age.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (this.age > 0) this.age--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🟡 Calculate button

          // ✅ Navigtiaon_multi Screen
          // 참고(https://github.com/londonappbrewery/Navigation-Flutter-Demo)

          GestureDetector(
            child: Container(
              color: AppColors.button.color,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/results');
            },
          )
        ],
      ),
    );
  }
}
