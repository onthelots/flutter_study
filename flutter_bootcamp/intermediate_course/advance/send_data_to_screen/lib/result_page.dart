import 'package:bmi_calculator/Constant/color_set.dart';
import 'package:bmi_calculator/Constant/text_set.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

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
            child: Text('Your Result', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white
            ),),
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
                    'OVERWEIGHT',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  Text(
                    '26.7',
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    'You have a higher than normal body weight. Try to exercise more',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
          ),

          // Expanded
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 50.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.button.color,
              ),
              width: double.infinity,
              height: 80.0,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
