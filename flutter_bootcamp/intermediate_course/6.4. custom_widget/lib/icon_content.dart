import 'package:flutter/material.dart';
import 'color_set.dart';

// textStyle
TextStyle labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: AppColors.textColor.color,
);

class IconContent extends StatelessWidget {

  // property
  final IconData icon;
  final String label;

  IconContent({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.textColor.color,
          size: 80.0,
        ),

        SizedBox(
          height: 15.0,
        ),

        Text(
          label,
          style: labelTextStyle
        ),
      ],
    );
  }
}