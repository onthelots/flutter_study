import 'package:data_type/data_type.dart' as data_type;


// ✅ Basic data types
// void main() {
String name = "lime"; // 문자열
bool isAlive = true; // boolean
int age = 44; // 정수 
double money = 66.55; // 정수(소수점)
num x = 12; // num은 int와 double의 부모 클래스
// }


// ✅ Lists (배열)
// [] 혹은 List<타입> 으로 활용함

// void main() {
  var numbers = [1,2,3,4];
  List<String> names = ['lime', 'nico'];

  print(numbers.length); // 4
  print(numbers.first); // 1
  print(numbers.last); // 4
// }

// 📌 아래와 같이, 배열 내에 조건문을 할당함으로서 특정 요소를 추가할 수도 있음
// void main() {
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    // [Collection if] 문법
    // 만약, giveMeFive 변수가 true일 경우, 5가 배열 내 할당됨
    if (giveMeFive) 5,
  ];

  print(numbers); // [1,2,3,4,5]
// }


// ✅ String interpolation (문자열 보간)
// $ (머니사인)뒤에 특정 변수를 사용하면 됨

// void main() {
var name = 'lime';
var age = 10;

// 일반적인 문자열은 $뒤에 해당 변수를 할당하면 되지만,
// 계산식의 경우 중괄호 { }를 $뒤에 할당함으로서 계산함
var greeting = 'Hello, my name is $name and i\'m ${age + 2}'; // Hello, my name is lime and i'm 12

//   print(greeting);
// }


// ✅ Collection For (배열 내 반복문)
// for-in 키워드를 통해 특정 배열 내 요소를 변형시켜 나타낼 수 있음

// void main() {
  var oldFriends = ["lime", "nico"];
  var newFriends = [
    'lewis',
    'ralph',
    'darren',

// 'oldFriends' 배열의 요소들을 반복해서 스캔한 후, ⭐️을 앞에 붙여서 문자열 보간을 실시함
// 이는, 다른 배열인 newFriends 내에 oldFriend를 요소로서 할당하는 방식임
for(var friend in oldFriends) "⭐️ $friend",
  
  ];

//   print(newFriends);
// }


// ✅ Maps
// dictonary와 동일함. 'key-value' 형식
// 중괄호 { }로 묶어서 활용함

// void main() {

  // Map<String, Object> 타입
  // key는 String 타입이며, 
  // value는 Object 타입.

  // 여기서 Object는 일종의 'Any' 타입임. 어떠한 데이터타입이던지 올 수 있음.
  var player = {
    'name': 'lime',
    'xp': 19.99,
    'superpower': false
  };

  Map<String, Object> team = {
    'name': 'liverpool',
    'nickname': 'Cops'
  };
// }

// Map의 타입을 아래와 같이 복잡하게 활용할 수도 있음
// 다만, 특정 데이터 모델을 만들 때는 아래와 같은 방식이 아닌, class를 활용하는 것을 추천함
// void main() {
//   Map<List<String>, Object> player = {
//     ['messi', 'ronaldo']: 'Goat',
//     ['son', 'saka', 'salah']: 'world Class',
//     ['Dier', 'Maguire']: false
//   };

//   print(player);
// }


// ✅ Sets
// Set 내에 속한 요소는 유니크함 (vs List와의 차이점)

// void main() {
  Set<String> setNames = {
    'messi',
    'Rolando'
  };

  var setNumbers = {
    1,
    2,
    3,
    4,
    4,
    4,
  };

//   print(setNumbers); // {1, 2, 3, 4}
//   print(setNames); // {1, 2, 3, 4}
// }