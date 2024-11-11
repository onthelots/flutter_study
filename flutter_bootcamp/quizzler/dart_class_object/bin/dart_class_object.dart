import 'dart:io';

import 'package:dart_class_object/dart_class_object.dart' as dart_class_object;

// ✅ Class, Object (클래스와 객체)

// 청사진, blueprint가 즉 일종의 Class
// 1) property : 속성
// 2) method : 함수, 메서드

// 위 2가지를 포함

// ✅ 1. Example
class Human {
  // 1) property
  // 🚫 초기화 혹은 late 키워드가 반드시 필요함! (null-safety)
  late double height;
  late int age;

  Human({required double height, required int age});

  // 2) method
  void introduce({required String name, required height, required age}) {
    print('name : $name');
    print('height : $height');
    print('age : $height');
  }
}

// ✅ Creating an Object from the Class

void main(List<String> arguments) {
  Human jenny = Human(height: 166, age: 16);
}
