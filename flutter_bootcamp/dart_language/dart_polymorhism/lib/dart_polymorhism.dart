
void main() {

  EletricCar myTesla = EletricCar();
  myTesla.drive(); //whells turn.

  LevitatingCar myHobberCar = LevitatingCar(userSetDestination: 'e-mart');
  myHobberCar.drive();

  // whells turn (기존 기능)
  // drive to e-mart (추가 기능)
}

// 부모 클래스 Car
class Car {
  int numOfSeats = 5;

  void drive() {
    print('whells turn.');
  }
}

// 자식 클래스 1 EletricCar
class EletricCar extends Car {

  int batteryLevel = 100;

  void chargeCar() {
    print('charging..');
  }

  // ✅ override keyword
  // 기존 부모클래스의 drive 메서드를, 자식 클래스에서 커스텀하여 활용할 수 있음
  @override
  void drive() {
    print('전기차가 나가신다~');
  }
}

// 자식 클래스 2 LevitatingCar
class LevitatingCar extends Car {

  late String destination;

  LevitatingCar({required String userSetDestination}) {
    destination = userSetDestination;
  }

  @override
  void drive() {
    // ✅ super keyword
    // 새롭게 정의하는것이 아니라, 부모클래스에서 실행하는 기능에 + 추가적으로 기능을 할당하는 방법

    super.drive(); // 기존 기능

    print('drive to $destination'); // 추가된 기능
  }
}