import 'question.dart';

// ✅ 추상화 객체를 기반으로 별도의 Class, 'QuizBrain'로 할당할 수 있음
class QuizBrain {

  int _questionNumber = 0;

  // ✅ 은닉화 방식
  // private!, 변수 앞에 '_'을 붙여 priavte로 변경하게 되면, 임의적으로 다른 모듈에서 수정이 불가능함
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  // ✅ private 접근방식
  // 동일함. _를 붙여서 활용 (그대로)

  // method 0. 항목 갯수에 따른 정지 메서드
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber ++;
    } else {
      print('end game');
    }
  }

  // method 1. 질문 반환 (private)
  String getQuestionText(int questionNumber) {
    return _questionBank[_questionNumber].question;
  }

  // method 2. correct Answer 반환 (private)
  bool getAnswer(int questionNumber) {
    return _questionBank[_questionNumber].answer;
  }
}