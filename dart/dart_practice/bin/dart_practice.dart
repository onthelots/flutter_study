import 'dart:io';

typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

// 실행은, 반드시 main() 함수에서 실시해야 함
void main() {
  var reversedNum = reverseListOfNumbers([1,2,3]);
  print(reversedNum);
}
