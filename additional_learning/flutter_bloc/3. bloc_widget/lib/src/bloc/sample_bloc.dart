import 'package:bloc/bloc.dart';

// 1. Bloc
// SampleEvent와 state값인 int값을 타입의 Bloc을 상속

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    print('init Samplebloc');

    // on 키워드
    on<SampleEvent>((event, emit) {
      print('Sample Event Called');
    });

    // on 키워드
    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}
