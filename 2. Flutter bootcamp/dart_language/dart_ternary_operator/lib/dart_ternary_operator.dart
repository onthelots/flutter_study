// ✅ Ternary Operator
// if / if-else와 같은 방식들을 줄일 수 있음

void main() {
  bool jackBauerIsAwesome = true;

  // 기존 (IF-ELSE)
  if (jackBauerIsAwesome == true) {
    print('That\'s great!');
  } else {
    print('Oh, no!');
  }

  // 개선 
  // operator 활용
  
  // 방식 1. true 명시
  jackBauerIsAwesome == true ? print('yes, is true') : print('no');

  // 방식 2. 암시적인 true, false (bool)
  // 그냥 작성할 경우에는 true이며, 그렇지 않다면 해당 변수 앞에 !(false)를 붙여서 조건식을 활용
  jackBauerIsAwesome ? print('yes, is true') : print('no');
}