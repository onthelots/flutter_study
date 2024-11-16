import 'package:bmi_calculator/constants/color_set.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/text_set.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResults;
  final String resultText;
  final String interpretation;

  ResultsPage({required this.bmiResults, required this.resultText, required this.interpretation});

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // children간 적절한 space
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
            margin: EdgeInsets.only(left: 15.0, top: 15.0),
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),

          // Expanded
          // > Custom Widget
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(15.0), // margin
              decoration: BoxDecoration(
                color: AppColors.activeCard.color,
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text(
                    this.resultText,
                    style: kResultTextStyle,
                  ),

                  Text(
                    this.bmiResults,
                    style: kBMITextStyle,
                  ),

                  Text(
                    this.interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),

          // Expanded
          BottomButton(
            textStyle: kLargeButtonTextStyle,
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}