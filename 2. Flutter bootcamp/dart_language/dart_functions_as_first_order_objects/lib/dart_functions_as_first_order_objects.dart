// ✅함수 1급 객체
// 함수를 인자로 전달하는 방식을 알아보자.

void main() {
  int add(int n1, int n2) {
    return n1 + n2;
  }

  int multiply(int n1, int n2) {
    return n1 * n2;
  }

  int result = add(3, 5);
  print(result);

  /// 2. 객체의(생성자) 인자로 넘길 수 있어야 한다.
  // 함수를 인자로 할당할 땐, 'Function' 이란 명칭의 타입으로 작성해야 함
  int calculator(int n1, int n2, Function calculation) {

    // 이렇게 되면, 인자인 calulation(함수)에 -> 인자인 n1, n2를 넘기는 방식
    // 반환 또한 함수를 반환하도록 설정 (당연히, 여기서는 해당 함수의 인자, 파라미터 형식을 맞춰서 반환해야겠지)
    return calculation(n1, n2);
  }

  int addReult = calculator(5, 6, add);
  print(addReult); // 11


  /// 1. 변수나 데이터에 할당 할 수 있어야한다.
  final Function(int, int, Function(int, int)) variableCalculator = (int n1, int n2, Function(int, int) calculation) {
    return calculation(n1, n2);
  };

  int multiplyResult = variableCalculator(5, 6, multiply);
  print(multiplyResult);


  /// 3. 반환값으로 사용할 수 있어야 한다
  /// 반환값은, 단일 반환값만 사용 가능 (=> fat arrow 활용)
  /// dart_beginning 예시 살펴볼 것 (https://github.com/onthelots/flutter_study/tree/main/dart_beginning/3.%20FUNCTIONS/functions)
  
  num plus(num a, num b) => a+b;

  print(plus(1, 2)); // 3
  
}