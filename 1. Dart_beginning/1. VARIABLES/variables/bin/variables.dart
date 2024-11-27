import 'package:dart_application/dart_application.dart' as dart_application;

// ✅ Hello, world

// 📌 main 함수 내에서 반드시 실행을 해야 함
// void main() {
//   print('hello, world!'); // 📌코드가 마무리되는 시점에는, 세미콜론(;)을 작성해야 함
// }


// ✅ variable

// void main() {
  // 📌 dart 컴파일러의 경우, 작동으로 타입을 유추함 (타입추론)
  // 보통, 이는 함수나 메서드 내부에 [지역변수]로서 선언할 경우에 사용함
  var name = '라임';
  // name = 1; // 그렇기 때문에, 당연히 해당 변수에 다른 타입의 값을 할당할 경우엔 컴파일 오류가 발생함

  // 📌타입을 아래와 같이 명시해줄 수 있음 (변수명 앞에 데이터 타입을 할당) (타입 어노테이션)
  // 이는 class에서 프로퍼티로 활용할 경우에 주로 타입을 명시함
  String typeName = '문자열 라임';
  // print('hello, $typeName');
// }


// ✅ dynamic type
// void main() {
  // 📌 아래와 같이, name이라는 변수를 선언한 후, 별도의 값을 할당하지 않는다면?
  // 이는 [dynamic] 타입이 됨. 즉, 원하는 데이터 타입을 할당할 수 있음.

  // JSON 파일과 함께 사용할 경우에는 활용되며, 이는 사실 크게 권장하지 않으나 사용할 경우가 있음

  var name;

  name = '라임';
  name = 2;
  name = false;

  // 조건문을 통해, 특정 데이터 타입인 경우에 따라 수정자 혹은 관련 옵션을 사용할 수 있음
  // 즉, dynamic 타입이기 때문에 활용할 수 있는 사항

  if (name is String) {
    print('name의 타입은 String 입니다.');
  } else {
    print('name의 타입은 dynamic 입니다.');
  }
// }


// ✅ null Safety
// 이전에는 사용되지 않았으나, 업데이트를 통해 도입됨
// null 값을 참조할 경우, 런타임 에러가 발생 -> app crash로 귀결됨

// 1. without null safety (null safety를 적용하지 않은 경우)

// bool 타입을 반환하는 isEmpty란 이름의 함수이고, 이는 String 타입의 '문자열' 이란 매개변수를 가지고 있음
// 또한, 반환값 boolean은 string의 길이가 0이거나, 0이 아닐 경우에 따라 결정됨
bool isEmpty(String string) => string.length == 0;


// main() {
  isEmpty(null); 
  // 🚫 Error: The value 'null' can't be assigned to the parameter type 'String' because 'String' is not nullable.
  // String 값은 nullable, 즉 null safety 하지 않다고 런타임 에러가 발생함
  
  // 📌 매개변수로 할당되는 값이 String(문자열)이 되어야 함을 예상했으나, 실제로 main()에서 실행된 isEmpty 함수에는 [null]값이 할당됨 -> 예상치 못한 값이 할당되었으므로 이는 오류가 발생할 수 밖에 없음.
  // 모든 var, 즉 변수는 'not nullable'임. 즉 반드시 null값이 아니어야 함
  // 위와 같은 상황에서 발생되는 것이 런타임 에러이며, 이는 null값을 참조했으므로 앱 크러쉬가 발생하게 됨
// }


// 2. with null safety (null safety를 적용한 경우)

// null값은 매우 유용함. 실제로 [아무런 값이 없는 경우]가 발생할 수 있으며, 이를 처리해야 될 의무가 있음
// 📌 null safety는 -> 데이터 타입 뒤에 물음표(?)를 붙이면 됨 (swift와 동일함)

// void main () {
  String? lime = 'lime'; // lime은 null일 수도 있다!
  lime = null; // 실제로 null 값이 할당된다면,,
  
  // 조건문을 통해 String값이 아닐 경우를 파악하게 되면 null값이므로 아래 프린트 구문이 실행됨
  if (lime is Null) {
    print('lime is null');
  }

   if (lime == null) {
    print('lime is null');
  }
// }


// ✅ final variable 
// 📌 const(javascript, typescript) 혹은 let(swift) -> 즉, 변경할 수 없는 변수, [상수]를 의미함

// void main() {
  final lime = 'lime';
  lime = 'jack'; // 🚫 Error: Can't assign to the final variable 'lime'.
// }


// ✅ late variable 
// final 앞에 붙일 수 있음
// 📌 이는 초기 데이터가 존재하지 않을 경우 사용할 수 있으며, 추후 api를 통해 데이터를 할당할 때 사용
// 반드시 데이터 타입을 명시해야 함

// void main () {
  late final String name;

//   // do something, go to api
  name = 'lime'; 
// }

// 🖐🏻 그렇다면, nullable로 만들면 되지 않나?
// late라는 키워드는, 구글에서 다음과 같이 해석함
// 'late 키워드는, 값의 초기화를 뒤로 미루나, 이는 개발자가 null을 실수로 사용하는 것을 막아준다'
// 즉, 일종의 '약속'임. 반드시 null값이 아니라, 나중에는 특정 값이 초기화 될 수 있도록 보장하는 것.

// 어떤 특정 변수를 에러 방지를 위해 nullable로 만드는데 -> 반드시 null이 아닌, 값이 포함되어야 하는 상황임
// 그런데, 만약 실제로 null이 할당되는 경우가 발생하여 오류가 발생하거나, UI 상으로 문제가 보일 경우가 있음

// 따라서, nullable로 만드는 대신, late 키워드를 할당함으로서 이를 방지할 수 있음. 이때 null값이 들어오게 되면 익셉션이 발생
// late 키워드는, 특정 변수를 선언할 때, 값을 할당(초기화)를 나중에 미루기 때문에 초기화 되기 전까지는 [해당 변수를 사용할 수 없도록 방지]하는 역할임
// https://lcr0916.tistory.com/72 (참고)


// ✅ constant variable
// final vs const 
// const는, [컴파일 타임]에서 해당 값을 알 수 있어야 함
// 즉, API를 통해 받아오는 값이 아닌, 앱스토어에 업로드 할 때 이미 알고있어야 할 일종의 'key' 등을 선언할 때 사용됨

// void main() {
//   const max_allowed_price = 120;
// }


// ✅ Recap
// 🔴 var : 변경할 수 있는 변수

// 🔴 final : 단 한번만 할당할 수 있는 변수. 재 할당할 수 없는 변수 (api를 통해 받아오는 값 등)

// 🔴 dynamic : 권장하지 않음. 어떤 데이터가 들어올 지 모르는 변수. 데이터 타입이 결정되지 않음 (var는 타입 추론을 통해, 할당된 값에 따라 데이터 타입이 결정되어 있음)

// 🔴 const : 컴파일 타임에서 알아야 하는 변수. 즉 key와 같은 값들

// 🔴 final과 const의 차이 :
// 둘다, 한번 값이 할당되면 변경할 수 없음.
// 예시로 들어보자. 여행을 간다고 하면 '여행지'를 결정하는 것은 이미 여행을 가기 전에 결정된 값이므로 이는 [const]값이 됨. 즉 컴파일시에 이미 값이 결정되어야 함 (ex. 이번 여행지는 도쿄)
// 반면에, 여행을 간 이후에 점심을 먹을 곳을 결정하고자 함. 이는 이미 여행을 가고 난 후에 결정한 값이므로 [final]값이 됨. 런타임 시점에서 값이 결정되며, 한번 결정되었으므로 변경할 수 없음 (ex. 도쿄에서 둘째날 점심은 그때 가서 정하자. 하지만 굶으면 안돼)

// null safety : null값에 참조하지 못하도록 함. 일반적으로 dart는 not nullable이므로, 데이터 타입 뒤에 물음표(?)를 붙여서 null일 가능성을 할당함.