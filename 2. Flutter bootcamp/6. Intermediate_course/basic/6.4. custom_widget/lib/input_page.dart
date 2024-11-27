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
                  child: ReusableCard(
                    boxColor: AppColors.card.color,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    boxColor: AppColors.card.color,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE'),
                  ),
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