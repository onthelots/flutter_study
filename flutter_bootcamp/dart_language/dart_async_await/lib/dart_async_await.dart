
void main() {

}

void aFunction() {

  // step1 - fast
  print('Hello, Moon!');

  // step2 -> slow.. 하지만 step 순서대로 실행되어야 함
  // 사진을 나타내는 함수 

  // 1) sync (동기)
  // - 아무리 오래걸리지만, '동기' 이므로, step1이 종료된 이후, step2가 마무리 될 때 까지 step3는 실행되지 않음

  // 2) async (비동기)
  // - 기다리지 않음. step3가 먼저 나타날 수도 있음

// step3 -fast
  print('Hello, Juypiter!');
}