import 'package:functions/functions.dart' as functions;

// ✅ Functions (함수)

// void -> 아무것도 리턴하지 않음.
// void sayHello(String name)

// 즉, return 키워드를 사용할 경우, 리턴할 타입을 작성해줘야 함
String sayHello(String name) {
  return "Hello $name. nice to meet you";
}

// void main() { 
//   print(sayHello("lime")); // Hello lime. nice to meet you
// }

// 즉시 리턴타입을 작성해 줄 경우, 중괄호 { }를 사용하지 않고, 아래와 같이 축약할 수 있음
// 이를 'fat arrow return' 방식이라고 함
// 이는, 단순히 한줄짜리 함수일 경우에만 사용됨
String sayHelloShort(String name) => "Hello $name. nice to meet you";

num plus(num a, num b) => a+b;

// void main() {
//   print(sayHelloShort('Echo')); // Hello Echo. nice to meet you
// }


// ✅ Named Parameters (이름이 있는 매개변수)

String introduce(String name, int age, String country) {
  return "hello $name, you are $age, come from $country";
}

// var introduce = introduce(name, age, country)
// 위와 같이 작성할 경우, 파라미터값에 어떤 값이 들어가야 할지 헷갈릴 수 있음!
// (이름, 나이, 국적)으로 표시가 되긴 하지만, 결과적으로 아래와 같이 해당 함수가 작성되게 됨. 
// 순서상으로 각각의 파라미터가 무엇을 의미하는지 알 수 없음
// var introduce = introduce('kate', 24, 'korea');

// 따라서, 어떤 파라미터 값이 들어가야 하는지 타이틀을 보여주기 위해 각각의 요소의 'name', 즉 [placeholder]를 작성해 줄 수 있음
// 파라미터 Scope에 단순히 중괄호{ }로 감싸주면 됨!

String introduceYourSelf({String name, int age, String country}) {
  return "hello $name, you are $age, come from $country";
}

// 그런데, 아래와 같이 파라미터 값을 작성하지 않는다면?
// nullable이 아니므로, 오류 발생!
// void main() {
  introduceYourSelf(
    name: 'jack',
    age: 23
  );

  // The parameter 'country' can't have a value of 'null' because of its type 'String', but the implicit default value is 'null'
  // 파라미터인 country는 null값을 가질 수 없는데, 그 이유는 해당 파라미터의 타입이 String이기 때문.
// }


// 따라서, 2가지의 방법으로 이를 해결해야 함

// ✅ Defaults Value Parameters (초기값이 있는 매개변수)
// 즉, 각각의 parameters 값의 초기값을 직접 임의로 설정하는 방식

String introduceWithDefaultsValue({String name = 'lime', int age = 23, String country = 'Wakanda'}) {
  return "hello $name, you are $age, come from $country";
}

void main() {
  print(introduceWithDefaultsValue(
    name: 'lime',
    country: 'Korea',
    age: 23
  ));
}

// 🖐🏻 그런데, 초기값을 설정하면 null safety 문제에 걸리진 않아도 
// 사용자가 반드시 파라미터값을 입력해야 하는 케이스라면? (defaluts value가 아닌, 실제 값이 할당되어야 함)

// ✅ Required Modified Parameters (반드시 작성해야 하는 파라미터 값)
// 아래와 같이, 파라미터 데이터 타입 앞에 ⭐️'requried' 키워드를 붙여, 필수 파라미터 값이 할당되어야 함
String introduceWithRequiredKeyword({required String name, required int age, required String country}) {
  return "hello $name, you are $age, come from $country";
}

// void main () {
//   print(introduceWithRequiredKeyword(name: 'nico', age: 23, country: 'WAKANDA'));
// }


// ✅ Optional Positonal Parameters 
// 아래와 같은 방식은, 모두 작성되어야 함
String sayHelloDefaults(String name, int age, String country) => "hello $name, you are $age, come from $country";

// 그런데, 만약 name과 age는 필수지만 특정 파라미터인 -> country는 초기값 혹은 작성하지 않아도 되는 방식으로 호출하고 싶다면?
// 이때 사용되는 것이 옵셔널 포지션 파라미터
String sayHelloOptionalPM(String name, int age, [String? country]) => "hello $name, you are $age, come from $country";

// void main() {
//   print(sayHelloOptionalPM('nico', 23)); // hello nico, you are 23, come from null
//   // 즉, country는 작성하지 않아도 되는 옵셔널 값이 되었으므로, 위와 같이 'null'로 출력됨
//   // 되도록 옵셔널로 작성하되, 초기값(defaults Value)을 작성해주는 것을 권장함.
// }

String sayHelloOptionalDVPM(String name, int age, [String? country = 'Wakanda']) => "hello $name, you are $age, come from $country";


// ✅ QQ Operator
// ??
// ?=

// 내 이름을 대문자로 변환하는 함수를 만들어보자.

String capitalizeName(String name) => name.toUpperCase();

// void main() {
//   var name = capitalizeName('lime');
//   print(name); // LIME
// }

// 그런데, 사용자가 name 파라미터 값으로 아무것도 입력하지 않았을 경우에는?

// String capitalizeNameNull(String? name) => name.toUpperCase(); // 여기서, 발생되는 문제는 name이란 파라미터가 String인지 아닌지 알 수 없으므로 toUpperCase() 메서드에 대한 문제가 발생함

// 따라서, 아래와 같이 조건문을 통해 변경시켜줄 수 있음. 
// 물론 Operator를 통해 코드를 간결하게 작성해 줄 수도 있음

String capitalizeNameNullCheck(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }

  return 'ANON';
}

// 축약형 (1) if(?) else (:)
// '조건이 맞을때' ? / '그렇지 않을 경우' :
String capitalizeNameNullCheckOperator(String? name) => name != null ? name.toUpperCase() : 'ANON';

// 축약형 (2) QQ Operator
// ??를 통해 null일경우와, 그렇지 않은 경우를 판단할 수 있음
String capitalzeNameNullCheckQuestionOperator(String? name) => name?.toUpperCase() ?? 'ANON';


// 축약형 (3) QQ assignment operator
// 만약, 특정 변수가 Nullable 이며, 초기값이 설정되지 않았을 경우
// ??= 를 통해 옵셔널, 즉 Null값일 경우 우측에 초기값을 할당해줄 수 있음
// void main() {
//   String? name;
//   name ??= 'nico';
//   print(name); 
// }


// ✅ Typedef
// 자료형 자체가 복잡해 헷갈리거나, 자주 사용될 경우 '커스텀 타입'을 만들어 보자.
List<int> reverseListOfNumbers(List<int> list) {
  var reversed = list.reversed;

  // toList()를 하는 이유는, 반환 타입인 List<int>가 다소 모호하기 때문에, 리터럴 타입으로서 만들어주기 위해 List(배열)를 재 선언함
  // Iterable 은 읽기 전요이며, 특정 위치에 접근하거나 추가/삭제할 수 없음. 따라서 리스트로 재 변환해야 함
  return reversed.toList();
}

// 현재, 리턴타입과 파라미터 타입 모두 List<int>임
// 따라서, 하나의 alias로서 타입을 선언해줄 수 있음
// 타입에 특정 타입이름을 설정한 후, 앞에 [typedef]란 키워드를 설정, 초기값으로 할당하고자 하는 타입 형태를 작성해주면 됨
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbersTypeDef(ListOfInts list) {
  var reverse = list.reversed;
  return reverse.toList();
}

void main() {
  print(reverseListOfNumbersTypeDef(
    [1,2,3] // [3, 2, 1]
  ));
}






