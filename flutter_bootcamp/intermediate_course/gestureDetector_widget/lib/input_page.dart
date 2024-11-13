import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  // 남, 여 카드 색상
  Color maleCardColor = AppColors.inactiveCard.color;
  Color femaleCardColor = AppColors.inactiveCard.color;

  // 현재 선택된 성별
  late int genderCode;

  // method
  // 1 = male
  // 2 = female
  void updateColor(int gender) {
    if (gender == 1) {
      maleCardColor = AppColors.activeCard.color;
      femaleCardColor = AppColors.inactiveCard.color;
      this.genderCode = 1;
    } else {
      femaleCardColor = AppColors.activeCard.color;
      maleCardColor = AppColors.inactiveCard.color;
      this.genderCode = 2;
    }
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

                // ✅ GestureDetector
                // 일반 버튼보다, 더 많은 옵션을 제공 (길게 누르기, 드래그 하기 등..)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Male Card Selected');
                      setState(() {
                        this.updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      boxColor: maleCardColor,
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
                      print('Female Card Seleted');
                      setState(() {
                        this.updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      boxColor: femaleCardColor,
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
