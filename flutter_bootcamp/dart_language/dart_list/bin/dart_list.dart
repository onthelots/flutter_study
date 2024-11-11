import 'package:dart_list/dart_list.dart' as dart_list;

// Picking From the list
// 0 Angela
// 1 James
// 2 Katie
// 3 Jack

void main() {
  List<String> myList = [
    'Angela', 'James', 'Katie', 'Jack'
  ];

// - Getting the index

// 1) 요소값 가져오기 [indexNumber]
  print(myList[3]); // Jack

// 2) indexOf (요소값을 통한 인덱스 숫자 가져오기)
  print(myList.indexOf('Katie')); // 2


// 3) 요소 추가하기
  myList.add('Ben');
  print(myList); // [Angela, James, Katie, Jack,, Ben]

// 4) 요소 삽입하기
  myList.insert(1, 'Nexi'); // 기존 1번 인덱스 (James) 자리에 Nexi를 삽입
  print(myList); // [Angela, Nexi, James, Katie, Jack, Ben]

// 5) 요소 삭제 & 

}