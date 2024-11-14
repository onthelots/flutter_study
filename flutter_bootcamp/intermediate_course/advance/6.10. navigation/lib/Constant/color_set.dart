import 'package:flutter/material.dart';

// enum
enum AppColors {
  appBar,
  background,
  inactiveCard,
  activeCard,
  button,
  textColor;
}

// extension (AppColors)
extension AppColorExtention on AppColors {
  Color get color {

    // 여기서 this는, AppColors를 의미함
    switch (this) {
      case AppColors.appBar:
        return Color(0xFF111639);
      case AppColors.background:
        return Color(0xFF0A0E21);
      case AppColors.inactiveCard:
        return Color(0xff111328);
      case AppColors.activeCard:
        return Color(0xff1D1E33);
      case AppColors.button:
        return Color(0xffEB1555);
      case AppColors.textColor:
        return Color(0xff8D8E98);
      default:
        throw UnimplementedError('Color for $this is not implemented.');
    }
  }
}