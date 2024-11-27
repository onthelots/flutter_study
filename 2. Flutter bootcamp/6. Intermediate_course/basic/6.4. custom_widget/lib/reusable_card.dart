import 'package:flutter/material.dart';

// Extract Widget (Stateless Widget)
class ReusableCard extends StatelessWidget {
  final Color boxColor;

  // ✅ Widget in Widget
  // ReusableCard 위젯은 동일한 속성을 가지고 있지만, 내부 컨텐츠는 다를 수 있음
  // 따라서, 특정 Widget을 'child'로 가질 수 있는 constructor를 설정함으로서 커스터마이징을 실시함
  final Widget? cardChild;

  ReusableCard({required this.boxColor, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0), // margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
      ),

      // 👉🏻 cardChild를 하위 위젯으로 설정
      child: cardChild,
    );
  }
}