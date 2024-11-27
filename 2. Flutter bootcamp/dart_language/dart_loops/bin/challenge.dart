
List<int> winningNumbers = [12, 6, 34, 22, 41, 9];

void main() {
  List<int> ticket1 = [45, 2, 9, 18, 12, 33];
  List<int> ticket2 = [41, 17, 26, 32, 7, 35];
  List<int> ticket3 = [12, 6, 34, 22, 41, 9];

  checkNumbers(ticket3);
  checkNumberWithSets(ticket3);
}

// 🟢 일반 For_in 구문을 활용한 계산
void checkNumbers(List<int> myNumbers) {
  int correctNumber = 0;
  for (int number in winningNumbers) {
    for (int myNumber in myNumbers) {
      if (number == myNumber) {
        correctNumber += 1;
      }
    }
  }
  print('You have $correctNumber matching numbers.');
}

// 🟢 sets을 활용한 교차 계산 (intersection)
// set은 중복값을 허용하지 않으므로, 교차 계산이 가능함
void checkNumberWithSets(List<int> myNumbers) {
  Set<int> matchingNumbers = winningNumbers.toSet().intersection(myNumbers.toSet());
  print('You have ${matchingNumbers.length} matching numbers.');
}