import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {

    // ✅ BlocProvider Widget 반환
    // 🚫 반드시 'child' Widget에서 영향력을 나타냄

    return BlocProvider(
      // 👉🏻 create : 현재 context에서, 미리 생성한 SampleBloc을 반환 (구독상품 생성)
      create: (context) => SampleBloc(),

      // 👉🏻 lazy : 말 그대로 lazy 속성이며, 이는 실제로 SampleBloc이 사용이 되었을 때(상태값이 변경되고자 event를 전달받았을 때)
      // 기본값은 true이며, 해당 SampleBloc을 create(구독상품 생성) 하자 마자 초기값이 할당되길 원한다면 true로 변경해도 됨
      lazy: false,

      // BlocProvider의 영향을 받을 child
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Bloc Provider Sample'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          // 👉🏻 read : 현재 위젯트리 내 생성된 Bloc, 즉 SampleBloc으로 접근하여, 관련된 이벤트(Sample Event)를 전달함
          // add : event를 던지는 방식
          context.read<SampleBloc>().add(SampleEvent());
        },
      ),
    );
  }
}
