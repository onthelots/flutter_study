import 'package:dart_stream/dart_stream.dart' as dart_stream;

// ✅ Future vs Stream
// 1. Future
// Future는 일종의 '영수증'. 나중에 단 한 번 데이터(제품)를 받을 약속이라고 보면 됨
// 이는, 결과를 받고, 작업이 마무리됨 (1회성)
// - ex) HTTP 요청, 파일 읽기 등

// 2. Stream
// - 파이프라인에 따라, 새로운 데이터가 여러번에 결쳐 받을 수 있는 이벤트. 여러 번에 걸쳐 데이터를 받을 약속!
// - ex) 실시간 이벤트, 데이터 스트리밍 등.

void main() {
  // 
}

