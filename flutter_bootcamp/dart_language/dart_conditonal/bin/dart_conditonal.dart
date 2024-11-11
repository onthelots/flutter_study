import 'package:dart_conditonal/dart_conditonal.dart' as dart_conditonal;
import 'dart:math';

// ✅ Dart Conditional (조건문)

// void main() {
//   String trackEnv = 'clear';
//   trainTrackState(trackEnv); // go!
// }

void trainTrackState(String track) {
  if (track == 'clear') {
    goStraight();
  } else {
    turnRight();
  }
}

void goStraight() {
  print('go!');
}

void turnRight() {
  print('turnRight ~');
}


// ✅ 1. Example (기본)
// loveScore
void main() {
  loveCalculator();
}

void loveCalculator() {
  int loveScore = Random().nextInt(100) + 1;

  print(loveScore);

  if (loveScore > 70) {
    print('You love each other like Kanye loves Kanye.');
  } else {
    print('You like each other');
  }
}

// ✅ 2. 부등 연산자
// && : and
// || : or
// ! : not

