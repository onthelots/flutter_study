// ✅ OOP 1 : 추상화 (Abstraction)
class Question {
  // 1) Question property 생성

  // 각각, 나중에 할당될 예정이므로 late 키워드를 붙여주자 (붙이지 않았을 때, 초기값을 할당해야 함)
  late String question;
  late bool answer;

  // 2) Question Structor 생성 (초기화 구조)
  Question(String question, bool answer) {
    this.question = question;
    this.answer = answer;
  }

  // 🚫 required를 통해 파라미터의 이름을 설정할 수 있음 (현재는 위 형태로 가자)
  // Question({required question, required answer});
}