import 'package:dart_stream_example/dart_stream_example.dart' as dart_stream_example;

// async* 
// 비동기 제너레이터 함수를 정의할때 활용되며, 이는 여러 값을 '스트림'으로 반환하며 비동기로 값을 순차적으로 생성함

// async와 async*의 차이 
// 일반적인 async와는 달리, async*는 여러 값을 순차적으로 하나씩 내보낼 수 있음
// async의 반환타입은 Future<T>이며, async*의 반환타입은 Stream<T>
Stream<int> countStream(int max) async* {
  for (int i= 0; i < max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // 스트림에 i값을 전달 (yield를 호출한 시점에 제너레이터 함수는 잠시 멈췄다가 다음 요청 시 다시 실행)
  }
}

void main() async {
  Stream<int> myCountStream = countStream(5);

  // listen을 통해 myCountStream의 yield에서 방출되는 'i' 값을 관찰
  myCountStream.listen((int myCount) {
    print('received: $myCount'); // 스트림 형식으로, 처리되며, 1초마다 Stream<int> 타입이 반환되어 출력됨
  });
}
