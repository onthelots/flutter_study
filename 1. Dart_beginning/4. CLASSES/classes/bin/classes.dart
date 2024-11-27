import 'dart:ffi';

import 'package:classes/classes.dart' as classes;


// ✅ Dart Class
// dart와 flutter는 모두 클래스로 되어있음. 따라서 문법을 마스터하는 것이 필요함
// 다른 언어와 어떤 것이 다른지 알아봐야 함

class Player {

  // 📌 function에서는 var 키워드를 사용해도 되나, Class에 선언되는 '프로퍼티'는 [반드시 타입이 명시]해야 함
  String name = 'lime';
  int xp = 200;
}

// void main() {
//   var player = Player(); // 인스턴스 생성 완료
//   player.name = 'nico';

//   print(player.name); // nico
// }

// 클래스 내부의 값을 바꾸지 못하도록, 상수 즉 'final' 키워드를 사용하자
class HelloPlayer {
  final String name = 'lime';
  int xp = 200;

  // 메서드 추가
  // 📌 this 키워드
  // 클래스 내부에 있는 메서드에 클래스 프로퍼티와 동일한 이름의 변수가 존재할 경우, [this]라는 키워드를 통해 접근. 일종의 self와 같다.
  void sayhelloWithThis() {
    print("Hello, my name is ${this.name}");
  }

  String sayhelloInsideProperty() {
    var name = 'nico';
    return "Hello, my name is $name"; // 클래스 프로퍼티와 sayhelloInsideProperty의 내부에 있는 name이란 명칭이 중복될 경우, 어떤것을 사용하느냐에 따라 this 키워드가 붙고, 붙지 않는다.
  }
}

// void main() {
//   var hello = HelloPlayer();
//   hello.sayhelloWithThis();
//   print(hello.sayhelloInsideProperty());
// }


// ✅ Constructors (+ Positonal Argument)
// 인스턴트를 생성할 때, 해당 클래스 프로퍼티의 초기값, 즉 📌 initalizer를 설정할 수 있음

class FootBallPlayer {
  late final String name;
  late int height;

  // swift에서의 init 키워드와 동일하게, 아래와 같이 클래스 인스턴스 생성 시 할당하고자 하는 name, height의 파라미터를 생성한 후,
  // self(swift)와 동일하게 클래스의 프로퍼티 값을 📌 [this] 키워드로 접근, name과 height를 인스턴스에서 작성되는 파라미터값, 즉 [생성자]으로 활용됨
  // 또한, 클래스 프로퍼티에는 late 키워드를 함께 작성해줌 (나중에 인스턴스 생성 시 할당될 것이기 때문)
  FootBallPlayer(String name, int height) {
    this.name = name;
    this.height = height;
  }

  void IntroducePlayer() {
    print("Player name: ${this.name} / height: ${this.height}");
  }
}

// void main() {
//   var footballplayer = FootBallPlayer('messi', 165);
//   footballplayer.IntroducePlayer();
// }

// 보다 간단하게 [positonal constructor] 코드를 작성해줄 수 있음
// 위 프로퍼티 초기화 코드를 아래와 같이 간결화함

class FootballPlayerSummary {
  late final String name;
  late int height;
  
  // this. 뒤에 클래스 프로퍼티를 그냥 바로 파라미터로 작성함
  FootballPlayerSummary(this.name, this.height);

   void introducePlayer() {
    print("Player name: $name / height: $height");
  }
}

// void main() {
//   var player = FootballPlayerSummary('Ronaldo', 185);
//   player.introducePlayer(); // Player name: Ronaldo / height: 185
// }


// ✅ Named Constructors Parameters (이름이 있는 생성자)
// 위 [positonal constructor]는 다소 위험할 수 있음. 
// 인스턴스를 생성할 시, 초기화 되는 각각의 프로퍼티 값들이 많아질 수록, 무슨 값을 작성해야 하는지 알 수가 없음
// 따라서, 기본 함수에서의 named Parameters와 같이, Class 또한 named를 실시할 수 있음

class MyPet {
  late final String name;
  late int height, weight, age; // 동일한 타입의 프로퍼티가 있다면, 이처럼 연속해서 나열하여 사용할 수도 있음.

  // 📌 함수와 동일하게, 각각의 파라미터 스코프를 중괄호 {}로 묶어주면 됨
  // 또한, 정보를 모두 작성하게 만들기 위해, defaults value 혹은 required 키워드를 붙여줄 수 있음
  MyPet({required this.name, required this.height, required this.weight, required this.age});

  void information() {
    print("my Pet $name");
    print("height : $height, weight: $weight, age: $age");
  }
}

// void main() {
//   var myPet = MyPet(
//     name: 'nico',
//     height: 50,
//     weight: 75,
//     age: 4
//   );

//   myPet.information();
// }


// ✅ Named Constructors (이름이 있는 생성자)
// 2개의 별도의 인스턴스를 생성할수 있게끔 클래스 내부에서 '이름이 있는 생성자'로 만들 수 있음.
// swift에서는 convenience init으로 사용됨

class FootBallTeams {
  late final String name;
  late final String color;
  late final int title;

  // 기본 생성자
  FootBallTeams({required this.name, required this.color, required this.title});

  // 📌 첫번째 constructor (Named Paramters)
  // 클래스 내부에, createBluteTeam이라는 새로운 생성자를 선언함
  // 콤마 (:) 뒤에 this 키워드를 통해 현재 클래스 프로퍼티의 값을 초기화 해줄 수 있음 -> Dart에게 여기서 FootBallTeams 클래스를 초기화하겠다는 것을 알림
  // 또한, 특정 프로퍼티의 값을 미리 설정할 수도 있음
  // 따라서, createBlueTeam이란 메서드를 통해 새로운 new 인스턴스를 생성할 수 있음.
  FootBallTeams.createBlueTeam({required String name, required int title}) : this.name = name, this.color = 'blue', this.title = title;

  // 📌 두 번째 constructor (positonal Paramters)
  // 여기는 positonal Paramters로 설정하되,
  // 첫 번째 constructor와 동일하게 초기화 할 수 있는 코드를 콤마 :를 통해 실시함.
  FootBallTeams.createRedTeam(String name, int title) : this.name = name, this.color = 'red', this.title = title;
}

// void main() {
//   var blueTeam = FootBallTeams.createBlueTeam(name: 'chelsea', title: 5); // 첫 번째 constructor

//   var redTeam = FootBallTeams.createRedTeam("liverpool", 10);
// }


// ✅ Class Constructors Recap
// API 데이터를 받아, 이를 Flutter의 Class형태로 만드는 과정을 알아보자.

class PlayerWithAPI {
  late final String name;
  late int xp;
  late String team;

  // fromJSON이란 메서드를 생성
  // 파라미터 타입으로는 Map (String-dynamic) 형식이며, 이를 'playerJSON'이라고 명명
  // 또한, 클래스 프로퍼티값을 초기화 하기 위해 콜론 : 뒤에 각각의 playerJSON의 map key로 접근하여 Value 초기값을 할당해주기로 함
  PlayerWithAPI.fromJSON(Map<String, dynamic> playerJSON) : name = playerJSON['name'], xp = playerJSON['xp'], team = playerJSON['team'];

  void sayhello() {
    print("Hello, my name is $name");
  }
}

// void main() {

// // 해당 팀에대한 정보가 Map형식의 List 배열값으로 전달된다고 가정해보자 (List<Map>)
//   var apiData = [
//     {
//       "name": "nico",
//       "team": "red",
//       "xp": 0,
//     },
//         {
//       "name": "lime",
//       "team": "green",
//       "xp": 0,
//     },
//         {
//       "name": "woody",
//       "team": "yellow",
//       "xp": 0,
//     }
//   ];

//   // forEach 구문을 활용하여, apiData에 있는 값을 차례로 접근하여 활용할 수 있도록 함
//   // forEach in 구문과 동일하게, action값은 특정 타입의 값이 저장됨.
//   apiData.forEach((playerJSON) {
//     var player = PlayerWithAPI.fromJSON(playerJSON);

//     // 클래스 내부에 있는 fromJSON constructor를 통해 새로운 인스턴스가 생성되었으니,
//     // 이는 PlayerWithAPI에 있는 다른 메서드 또한 접근할 수 있는 것임.
//     // 아래와 같이 sayhello 메서드도 실행할 수 있음.

//     // 📌 단순히 메서드가 아닌, fromJSON constructor라는 것을 클래스 내부에 생성함으로서 별도의 초기화된 인스턴스를 만들 수 있는 메서드를 선언해 줬다고 보면 이해가 편할듯

//     player.sayhello();
//     // 출력 결과

//     // Hello, my name is nico
//     // Hello, my name is lime
//     // Hello, my name is woody
//   });
// }


// ✅ Cascade Notation

class Artist {
  String name;
  int albumNum;
  int age;

  Artist({required this.name, required this.albumNum, required this.age});

  void introduce() {
    print("artist name: $name, number of album: $albumNum, age: $age");
  }
}

// void main() {
//   var artist = Artist(name: 'IU', albumNum: 5, age: 30);

//   // 만약, 생성된 artist의 속성을 변경하고자 한다면?
//   // 아래와 같이, 모두 각각의 속성에 접근하여 변경하는 방법으로 진행해왔음.
//   artist.name = "radiohead";
//   artist.albumNum = 11;
//   artist.age = 55;

//   // 이러한 긴 코드를 방지하고자, cascade notation을 통해 축약할 수 있음
//   // .. 코드를 연속해서 인스턴스 뒤에서 작성한 후
//   // 맨 마지막에만 세미콜론(;)으로 닫아줌
//   // 즉, ..는 newArtist를 참조하는 것임.
//   var newArtist = Artist(name: 'GD', albumNum: 4, age: 32)
//   ..name = 'LAS'
//   ..albumNum = 10
//   ..age = 55;

//   newArtist.introduce();

//   // 심지어, 클래스 내부의 메서드 또한 ..을 통해 연속해서 실행할 수 있음.
//   // 맨 마지막에만 ; 붙이는걸 잊지 않도록 해야 함.
//   var oldArtist = Artist(name: 'John Mayer', albumNum: 15, age: 40)
//   ..name = '조용필'
//   ..albumNum = 11
//   ..age = 65
//   ..introduce();
// }

// ✅ Enum (Enumeration)
// 실수를 줄여주는 방식임. 
// 옵션값을 작성할 때, 개발자가 잘못 작성하는 경우가 있으므로 이를 줄여주기 위해 선택의 폭을 줄이는 Enum을 사용함
// :을 통해 특정 값을 작성해 주는 것이 아닌, . 수정자를 통해 접근하는 모든 것(예를 들어, Flutter의 Color)을 Enum으로 접근하게 됨
// Enum 또한 일종의 타입이므로, 기존 데이터 타입을 대체할 수 있음! 

enum Age {
  old, young
}

class ArtistEvaluation {
  String name;
  int albumNum;
  Age age; // 여기, 데이터 타입을 Enum인 Age로 대체

  ArtistEvaluation({required this.name, required this.albumNum, required this.age});

  void introduce() {
    print("artist name: $name, number of album: $albumNum, age: $age");
  }
}

// void main() {
//   // 인스턴스 생성 시에도 age의 값을 enum타입으로 작성할 수 있음.
//   var someArtist = ArtistEvaluation(name: '뉴진스', albumNum: 2, age: Age.young);

//   someArtist.introduce();
// }



// ✅ Abstract Classes (추상화 클래스)
// 일종의 blue print! ---> swift의 protocol과 유사함
// 즉, abstract class를 선언해 놓고 -> 다른 클래스에서 이를 extension (extends) 함으로서 해당 추상화 클래스를 구체화 할 수 있음

// 1. 추상화 클래스
// 구체적인 방식은 작성해놓지 않는다!
abstract class Animals {
  void walk();
  void eat();
  void sleep();
}

// 2. 일반 클래스 (그런데, 추상화 클래스를 곁들인)
// extend한 함수, 즉 Animals 추상화 클래스에서 선언한 프로토콜은 상속받는 클래스에서 직접 구체화 해줄 수 있음.
class Human extends Animals {
  String name;
  int age;

  Human({required this.name, required this.age});

  @override // 해당 override 키워드는 선택사항 이지만, 명시해 주는 것을 권장함 (헷갈리자네~)
  void walk() {
    print('human walking...');
  }

  void eat() {
    print('human eating...');
  }

  void sleep() {
    print('human sleeping...');
  }
}

class Cat extends Animals {
  String name;
  int age;

  Cat({required this.name, required this.age});

  void walk() {
    print('cat walking...');
  }

  void eat() {
    print('cat eating...');
  }

  void sleep() {
    print('cat sleeping...');
  }
}


// ✅ Inheritance (상속)
// 추상화 클래스와 유사한 방식이지만, 이는 상위 클래스에서 구체적인 로직을 구상한 후 -> 하위 클래스에서 이를 상속받아 사용하는 것을 의미함

class Cloth {
  final int price; // 변수 선언 

  Cloth({required this.price}); // 초기화

  void priceTag() {
    print('price tag : $price');
  }
}

// Bags, 즉 책은 모두 가격을 가지고 있으므로
// 위에 선언한 공통 상위 클래스인 Cloth의 속성을 상속받아 활용하고자 함.
// abstract class와 동일하게, extends 키워드 이후, 상속할 상위 클래스명을 작성함
enum Color {
  red, green, blue
}

class Bags extends Cloth {
  String name;
  final Color color;
  
  // 초기화를 실시할 때, 상위 클래스에서 선언한 초기화 또한 함께 포함시켜야 함!
  // ⭐️ : 키워드 --> class Constructor의 initalizer를 위한 방식이며,
  // 'super' 키워드 내부에 상위 클래스에서 상속되는 price를 초기화 함
  Bags({
    required this.name,
    required this.color,

    // Bags의 초기값으로 상위 클래스의 프로퍼티인 price를 -> Bags 프로퍼티들과 동일하게 초기화 선언을 하고,
    required int price,
  }) : super(price: price);
  // : , 즉 constructor 생성시와 동일하게 super 키워드 뒤에 price(상위 클래스 참조): price(초기값)를 참조하여 선언함

  // 📌 override (상위 클래스에서 선언한 메서드를 하위 클래스에서 커스텀 할 수 있음)
  @override
  void priceTag() {
    super.priceTag();
    print('and name is $name, color is $color');
  }
}

// void main() {
//   var bag = Bags(name: 'Gucci', color: Color.blue, price: 13);
//   bag.priceTag(); // price tag : 13 (상위 클래스에서 선언한 priceTag 함수 또한 호출할 수 있음)

//   bag.priceTag(); // @override 키워드를 통해 메서드를 변경했다면, bag은 현재 Bags 클래스이므로, 오버라이드 된 메서드가 실행됨
//   // and name is Gucci, color is Color.blue
// }


// ✅ Mixins (믹스인. 생성자가 없는 클래스)
// extends가 아닌, with 키워드를 통해 각각의 상속받는 클래스에 있는 프로퍼티와 메서드를 사용할 수 있음
// 이는 상속이 아닌, '포함'의 개념이며, 부모클래스가 되지 않으면서 다른 클래스에서 사용할 수 있도록 함
// 이 또한 여러개를 상속하여 사용할 수 있는 swift의 protocol과 유사하며, 다른점은 해당 mixin할 수 있는 클래스는 구체적인 로직을 작성할 수 있다는 것임.
// mixin을 할 클래스 앞에는 📌 [mixin] 키워드를 반드시 사용해줘야 함

mixin class Famous {
  final String famous = "Good Quality";
}

mixin class Awareness {
  void awareness() {
    print('is really famous');
  }
}

// 상단에 있는 Famous, Awareness 클래스를 포함(Mixins)하는 WoyoungMiTShirt를 선언해보자.
class WooyoungMiTShirt with Famous, Awareness {
  final String name;
  WooyoungMiTShirt(this.name);
}

void main() {
  var tshirt = WooyoungMiTShirt('3version');

  // WooyoungMiTShirt 클래스의 첫 번째 Mixins 클래스인 Famous로 접근 가능
  tshirt.famous

  // WooyoungMiTShirt 클래스의 두 번째 Mixins 클래스인 Awareness로 접근 가능
  tshirt.awareness()
}





