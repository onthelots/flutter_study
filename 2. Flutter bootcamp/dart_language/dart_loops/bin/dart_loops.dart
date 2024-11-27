import 'package:dart_loops/dart_loops.dart' as dart_loops;

// ✅ Dart Loops
// 기본적으로 C 언어 스타일의 Loop를 따르는 방식과, For in 방식이 있음

// void main() {

//   // 기본적인 형태
//   // (다룰 값; 조건식; 반복에 따른 값 증감)
//   for(int i = 2; i<10; i+=1) {
//     print(i);
//   }
// }

void main() {
  // buyMilk(7);
  // playSong99BottlesOfBeer(10);
  pieMaker();
}

// 🟢 Loops 1 (C언어 스타일)
void buyMilk(int days) {
  for(int i = 1; i<= days; i+=1) {
    print('Buying milk on day $i');
  }
}

// ✅ Challenge (99 Bottles of Beer)
// https://www.99-bottles-of-beer.net/lyrics.html

void playSong99BottlesOfBeer(int bottle) {
  int nextBottle = 0; // 외부 변수 선언

  for (int i = bottle; i > 0; i-=1) {
    nextBottle = i-1;
    print('$i bottles of beer on the wall, $i bottles of beer.');
    print('Take one down and pass it around, ${nextBottle} bottles of beer on the wall.');
    print('remainBottole = $nextBottle');
  }
   print('end'); // 마지막 메시지 출력
}

// 🟢 Loops 2 (For_in)
/*
for (String fruit in fruits) {
 // do something with fruit
}
*/

List<String> fruits =[
  'apple',
  'pear',
  'orange',
  'grape',
  'banana'
];


void pieMaker() {
  for(String fruit in fruits) {
    print(fruit + ' pie');
  }
}