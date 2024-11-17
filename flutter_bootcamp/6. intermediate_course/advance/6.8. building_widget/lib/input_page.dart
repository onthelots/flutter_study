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
  int weight = 60;
  int age = 19;


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


// 커스텀 버튼 만들기
class RoundIconButton extends StatelessWidget {

  final Function()? onPressed; // VoidCallback 함수이므로, 이렇게 타입을 제대로 지정해줘야 함 Function() (반환값이 void인 함수)
  late final IconData icon; // 아이콘

  RoundIconButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      // 버튼의 Constratins, 제약조건 중 크기를 결정
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(), // 모양 (CircleBorder -> 원형)
      elevation: 6.0, // 그림자
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(
        this.icon,
        color: Colors.white,
      ),
    );
  }
}
