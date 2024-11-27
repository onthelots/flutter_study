import 'package:flutter/material.dart';

class CustomCheckerButton extends StatelessWidget {
  final double padding;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback action;

  const CustomCheckerButton({
    super.key,
    required this.padding,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
          onPressed: action,
        ),
      ),
    );
  }
}