import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

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

  // 1) question number 증가
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // 2) question text 반환
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  // 3) answer 반환
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }


  // 4) 종료 시점을 알림으로 처리할 것
  bool isFinished() {

    // questionNumber와 questionBank의(-1) 길이가 똑같아 질 경우, 종료되었음을 전달할 것
    if (this._questionNumber == _questionBank.length - 1) {
      return true;
    }

    return false;
  }

  // 5) 초기화 (questionNumber)
  void reset() {
    this._questionNumber = 0; // 0으로 초기화
  }
}
