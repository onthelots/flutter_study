import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

/// ✅ Bloc
/// CountBloc
class CountBloc extends Bloc<CountEvent, int> {

  /// 초기화 및 이벤트(콜백) 핸들러 등록
  CountBloc() : super(0) {

    /// stream 1 :  AddCountEvent
    // 👉🏻 on : 콜백 핸들러 선언 (구독, 등록)
    on<AddCountEvent>(
      // event, 그리고 상태를 내보내는 함수(emit)을 인자로 받음
      (event, emit) {
        // 👉🏻 emit : emit()을 활용한 New State 생성 및 방출 (비즈니스 로직 실시)
        emit(state + 1); // 현재 상태에 1을 더한 새로운 상태 emit
      },
    );

    /// stream 2 : SubstractCountEvent
    on<SubstractCountEvent>(
      (event, emit) {
        emit(state - 1); // 현재 상태에서 1을 뺀 새로운 상태 emit
      },
    );
  }
}

/// ✅ Event
/// CountEvent (abstract, 즉 추상화 클래스)

// 👉🏻 Equatable : 상태 관리 라이브러리에서 상태나 이벤트의 값 기준 비교할 수 있도록 함
// 이는, 불필요한 상태 업데이트를 방지함으로서 앱의 성능을 최적화 시킬 수 있음.

// 구체화 클래스 내에서 'props'을 통해 비교를 위한 속성을 할당할 수 있음.
abstract class CountEvent extends Equatable {}

/// Event 1 : AddCountEvent 구체화
class AddCountEvent extends CountEvent {
  @override

  // 👉🏻 props : 동등성 비교에 사용할 속성을 정의하는 getter
  // 여기서는, AddCountEvent 인스턴스를 생성해도 모두 '동일한 역할과 기능'을 담당하기 때문에, 비교할 것이 없으므로 빈 []로 할당함.
  List<Object?> get props => [];
}

/// Event 2 : SubstractCountEvent 구체화
class SubstractCountEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}
