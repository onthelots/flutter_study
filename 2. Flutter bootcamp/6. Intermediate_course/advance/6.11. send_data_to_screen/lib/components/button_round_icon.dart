import 'package:flutter/material.dart';

// 커스텀 버튼 만들기
class RoundIconButton extends StatelessWidget {

  final Function()? onPressed; // VoidCallback 함수이므로, 이렇게 타입을 제대로 지정해줘야 함 Function() (반환값이 void인 함수)
  late final IconData icon; // 아이콘

  RoundIconButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

      // 버튼의 Constratins, 제약조건 중 크기를 결정
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape: CircleBorder(), // 모양 (CircleBorder -> 원형)
      elevation: 6.0, // 그림자
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(
        this.icon,
        color: Colors.white,
      ),
    );
  }
}