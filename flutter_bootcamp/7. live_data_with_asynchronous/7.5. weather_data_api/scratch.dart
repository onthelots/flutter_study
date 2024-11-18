import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);

  // Task 1 complete

  // ... 3second 이후..
  // Task 2 complete
  // Task 3 complete
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// ✅ Future
// subscribe. 일종의 영수증이라고 보면 됨
// 결과물이 나오는 것을 보증하는데, 이는 시간이 빠를수도, 늦을 수도 있음
// 다만, 'Future'라는 영수증과 결과물을 반환하는 객체를 생성함으로서
// 이를 'task3'라는 구독자에게 전달한 후 -> task2가 마무리 되었을 때 해당 값을 가지고 호출될 수 있다는 점
// 다시 말해, [완료되지 않은 작업의 결과를 대표하는 객체]

// 즉, 이러한 방식 자체가 '비동기 프로그래밍'을 동기화 처럼 핸들링 하는 작업이라고 볼 수 있음

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  late String result;

  // async 메서드 -> 비동기로 실행되므로, 다른 라인이 먼저 작업이 끝난다면 실행해도 좋음
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}