import 'package:dart_static_modifier/dart_static_modifier.dart' as dart_static_modifier;

void main() {
  
  // 1) 인스턴스를 생성하고,
  Square mySqure = Square();

  // 2) 정해지지 않은 속성을 정의
  mySqure.colour = 'Red';

  Square yourSqure = Square();
  mySqure.colour = 'Blue';

  // Q. 그런데, 해당 클래스에서 이미 결정된 Sides라는 값은? 
  // 무조건 4변이 필요하니, numberOfSides는 4라는 값이 고정되어야 하는데..

  // 만약, 객체의 numberOfSides 속성을 알고싶다면, 역시나 Square()라는 인스턴스를 또 생성하고, 여기서 속성에 접근해야 함 
  // 👉🏻 이는 '🚫리소스 낭비'임
  Square().numberOfSides;

  // ✅ Static (정적 타입)
  // class wide 성격. 이는 객체 자체가 변경되는것이 아닌, 객체 자체의 변경되지 않아야 하는 정적인 속성을 의미함
  // print(Icosagon.numberSides);

  Circle circle = Circle();
  
}

class Square {

  int numberOfSides = 4;
  late String colour;
}

class Icosagon {
  static int numberSides = 20;
}

class Circle {
  static const double pi = 3.1415926;
  // defaults value로 설정 -> 모든 Circle 객체가 생성되던지 간에, 변하지 않는 값임

  // 🖐🏻 메서드 또한 static 설정이 가능
  static void workOutCircumference({required double radius}) {
    double circumference = 2 * pi * radius;
    print(circumference);
  }
}