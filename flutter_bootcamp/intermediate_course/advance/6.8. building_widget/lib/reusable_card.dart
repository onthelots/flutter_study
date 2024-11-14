import 'package:flutter/material.dart';

// Extract Widget (Stateless Widget)
class ReusableCard extends StatelessWidget {
  final Color boxColor;
  final Widget? cardChild;

  // GestureDectctor의 'onTap'의 경우
  // GestureTapCallback 형태를 반환해야 하므로, Function이 아닌, 다음과 같이 타입을 작성
  final GestureTapCallback? onPress;

  ReusableCard({required this.boxColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        margin: EdgeInsets.all(15.0), // margin
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),

          // 1) box Color
          color: boxColor,
        ),

        // 2) child
        child: cardChild,
      ),

      // 3) onPress
      onTap: onPress,
    );
  }
}
