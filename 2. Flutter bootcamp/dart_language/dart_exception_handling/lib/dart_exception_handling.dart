main() {
  // print(parseAStringAsDouble()); // 20.0

  // print(parseBStringAsDouble());
  // 🚫 런타임 에러 발생 --> 앱이 다운되는 문제가 발생할 수 있음
  // Unhandled exception:
  // FormatException: Invalid double

  print(parsDStringAsDouble());
  // ✅ Null-safety를 적용한 try-catch 구문
  // Exception Error : FormatException: Invalid double
  // abc
  // null
}



// 정상적인 케이스 (parse)
double parseAStringAsDouble() {
  String aString = '15';
  
  // ✅ parse -> 문자열을 특정 타입으로 변환할 수 있는 수정자
  double myStringAsDouble = double.parse(aString);
  
  return (myStringAsDouble + 5);
}

// 비 정상적인 케이스 1 (만약, String이 숫자 형식이 아닌, 문자 형식이라면?)
// double parseBStringAsDouble() {
//   String bString = 'abc';

//   double myStringAsDouble = double.parse(bString);
  
//   return (myStringAsDouble + 5);
// }

// 비 정상적인 케이스 2 (Try - catch 구문을 활용한다면?)
// double parseCStringAsDouble() {
//   String cString = 'abc';

//   try {
//     double myStringAsDouble = double.parse(cString);  
//     // 🚫 함수의 반환값이 보장되지 않았기 때문에, 해당 메서드는 사용할 수 없음.
//     // 즉, return 값이 double이 되어야 하는데, 여기서는 Nullable -> 다시 말해 null값이 리턴될 수 있으므로.
//     return (myStringAsDouble + 5); 
//   }
//   catch (error){
//     print(error);
//   }
// }

// 비 정상적인 케이스 3 (Try - catch에 null-safety 개념을 적용해보자.)
double? parsDStringAsDouble() {
  String dString = 'abc';

  try {
    double myStringAsDouble = double.parse(dString);  
    // 🚫 함수의 반환값이 보장되지 않았기 때문에, 해당 메서드는 사용할 수 없음.
    // 즉, return 값이 double이 되어야 하는데, 여기서는 Nullable -> 다시 말해 null값이 리턴될 수 있으므로.
    return (myStringAsDouble + 5); 
  }

  // Catch 구문에 잡히지 않는다면, 앱이 무조건 Crach!
  catch (error){
    print('Exception Error : $error');
    return null;
  }
}