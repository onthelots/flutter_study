import 'package:bmi_calculator/constants/color_set.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Color? color = AppColors.button.color;
  final TextStyle textStyle;
  final String text;
  final Function onTap;

  BottomButton({required this.textStyle, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            this.text,
            style: this.textStyle,
          ),
        ),
      ),
      onTap: () {
        this.onTap();
      },
    );
  }
}
