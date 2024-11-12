// ✅ Constructor
// 청사진(Class)을 기반으로 하나의 객체를 생성하는 과정

class Human {

  // Property
  late double height;
  late int age;

  // Constructor
  // Human({required height}) {
  //   this.height = height;
  // }

  // Constructor (프로퍼티의 값을 그대로 할당한다면, 아래와 같이 함축하여 활용 가능)
  Human(this.height, this.age);
  
  // method
  void grow(int numberOfYears) {
    this.age = age + numberOfYears;
  }
}

// 청사진, Human유형을 가진 객체, Constructor를 생성

void main() {

  // 생성 시점에서, 어느 속성을 초기화 할지 설정함 
  // 왜? 프로퍼티에 대한 초기값을 설정하지 않았기 때문에 -> 객체 생성 시, 할당
  Human jenny = Human(16.0, 5);
  print(jenny.height);

  Human james = Human(20.0, 4);
  print(james.height);
}

