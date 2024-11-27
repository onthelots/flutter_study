// ✅ Question Class 생성

class Question {
  // 1) Question property 생성

  // 각각, 나중에 할당될 예정이므로 late 키워드를 붙여주자 (붙이지 않았을 때, 초기값을 할당해야 함)
  late String questionText;
  late bool questonAnswer;

  // 2) Question Structor 생성 (초기화 구조)
  Question({required String questionText, required bool questionAnswer}) {
    this.questionText = questionText;
    this.questonAnswer = questionAnswer;
  }
}