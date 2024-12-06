import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class BlocSelectorBloc extends Bloc<BlocSelectorEvent, BlocSelectorState> {
  BlocSelectorBloc() : super(BlocSelectorState()) {

    // eventHandler 1 : changeState (changeState boolean 값을 토글)
    on<ChangeStateEvent>((event, emit) {
      emit(state.clone(changeState: !state.changeState));
    });

    // eventHandler 2 : value + 1
    on<ValueEvent>((event, emit) {
      emit(state.clone(value: state.value + 1));
    });
  }
}

abstract class BlocSelectorEvent {}

class ChangeStateEvent extends BlocSelectorEvent {}

class ValueEvent extends BlocSelectorEvent {}

// ✅ Bloc State 값에 대한 선언
// - SelectorBloc 내 State 타입으로 활용 가능
class BlocSelectorState extends Equatable {

  // 2가지 상태값
  final bool changeState;
  final int value;

  BlocSelectorState({this.changeState = false, this.value = 0});

  // Constructor : clone
  BlocSelectorState clone({
    bool? changeState,
    int? value,
  }) {
    return BlocSelectorState(
      changeState: changeState ?? this.changeState,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [value, changeState];
}
