import 'package:dart_mixins/dart_mixins.dart' as dart_mixins;

// main
void main() {
  // Animal().move();
  // Fish().move();
  // Bird().move();
  Duck().swim();
}

// Animal
class Animal {
  void move() {
    print('changed position');
  }
}

// Bird - extends, override
class Bird extends Animal {
  @override
  void move() {
    super.move();
    print('by flying');
  }
}

// Fish - extends, override
class Fish extends Animal with CanSwim {
  
}

mixin CanSwim {
  void swim() {
    print('changing position by swimming');
  }
}

mixin CanFly {
  void fly() {
    print('changing position by flying');
  }
}

// Duck -> Animals이긴 한데, Bird와 Fish의 속성 모두가 가능하지?
// extend, 즉 상속은 단 '하나'만 가능함
// 따라서, 다른 속성을 모두 활용하기 위해 -> Mixin 클래스를 'with'을 통해 할당받을 수 있음 (이는, 1개 이상도 가능함)
class Duck extends Animal with CanFly, CanSwim {
  // 
}

// AirPlane -> 상속없이, Mixin만 사용할 수 있음
class Airplane with CanFly {

}

// ✅ Mixin이 유용한 이유?
// 만약, Animals를 상속받는 다수의 클래스들이 존재한다고 가정하자.
// 이 때, 동일한 메서드인 move()를 override 하여 사용한다고 가정했을 때 -> 동일한 성격의 상속받은 Class들은 모두 제 각각 move()에 유사한 기능을 할당할 것이고
// 해당 기능이 변경&수정된다면, 또 각각의 Class로 접근하여 코드를 수정해줘야 하는 불편함이 있음.

// 👉🏻 따라서, 만약 고유한 유형의 속성&기능을 동일한 성격의 Class에게 '상속'이 아닌, '추가 플러그인'과 같이 부여해준다면?
// 수정시, 해당 플러그인만 변경하면 됨