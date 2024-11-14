// ✅ Enum
// The action of establishing the number of something
// on-off에 대한 옵션을 제공

// 일반적인 형태는 다음과 같음
enum EnumName { typeA, typeB, typeC }



// 1️⃣ 기존대로 Class에서 선언한 Car의 종류를 나타내고자 할때는 다음과 같이 작성함
// 주석으로 표현은 하긴 하지만, 코드가 복잡해지거나 긴 시간 이후에 확인하게 된다면 헷갈릴 가능성이 높음
void main() {
    // Car myCar = Car(carStyle: 1); // 1 ? 1이 무엇인디여..?

    Car myCar = Car(carStyle: CarType.convertible);
}

class Car {

    // REMEMBER 1 = hatchback, 2 = SUV ...
    // int carStyle;

    CarType carStyle;
    
    Car({required this.carStyle});
    
}

// 2️⃣ Enum으로 정리한다면?
// 아래와 같이, 명명된 값으로 지정해줄 수 있음
enum CarType {
    hatchback,
    SUV,
    convertible,
    coupe,
}
