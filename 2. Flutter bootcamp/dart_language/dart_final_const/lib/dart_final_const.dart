void main() {

  int myNumber = 2; 
  const int myConst = 2;
  final int myFinal = 3;

  myNumber = 10; // 이건, 당연히 variable하므로 변경할 수 있음

  myConst = 4; // Can't assign to the const variable 'myConst' (변경할 수 없음)
  myFinal = 5; // Error: Can't assign to the final variable 'myFinal'. (변경할 수 없음)

  // 둘다 똑같은거 아닌가?.?
  // 예를 들어보자. 현재 시간을 보여주는 앱이 있다고 가정한다면

  // 1) const로 설정해보자.
  const DateTime constTime = DateTime.now(); // The constructor being called isn't a const constructor
  // 위 오류 사항과 같이, Time이라는 Constructor는 const와 함께 사용할 수 없다.

  // 🖐🏻 왜? DateTime은 [앱이 실행되는 현재] 시간을 기점으로 결정되는데,
  // const는 <컴파일>. 그러니까 실제 앱이 '구동되기 전' 기계어로 변역 시에 값이 결정되기 때문


  // 2) final로 설정해보자.
  final DateTime finalTime = DateTime.now(); // ok
  // 아무 문제 없다. 
  // final은 앱이 구동되고 있는 시점인 <런타임> 때 결정되기 때문.


}