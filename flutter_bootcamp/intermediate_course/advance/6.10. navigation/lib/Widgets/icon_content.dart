import 'package:flutter/material.dart';
import '../Constant/color_set.dart';
import '../Constant/text_set.dart';

class IconContent extends StatelessWidget {

  // property
  final IconData icon;
  final String label;
  final bool isActive;

  IconContent({required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.white : AppColors.textColor.color,
          size: 80.0,
        ),

        SizedBox(
          height: 15.0,
        ),

        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.textColor.color,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}