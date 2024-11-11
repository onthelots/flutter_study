
void main() {

  // myNormalCar 인스턴스 생성
  // Car myNormalCar = Car();
  // print(myNormalCar.numOfSeats); // 5
  // myNormalCar.drive();

  // myTesla (Car class 상속)
  EletricCar myTesla = EletricCar();
  myTesla.drive(); //whells turn.

}

class Car {
  int numOfSeats = 5;

  void drive() {
    print('whells turn.');
  }
}


// ✅ 상속 (Inheritance)
// extends 키워드!
class EletricCar extends Car {

  // 아래와 같은 Car Class에 있는 프로퍼티, 메서드를 중복으로 사용할 필요 없이, 상속(extends)한다면 그대로 받아서 사용 가능

  // int numOfSeats = 5;

  // void drive() {
  //   print('whells turn.');
  // }

  int batteryLevel = 100;

  void chargeCar() {
    print('charging..');
  }
}