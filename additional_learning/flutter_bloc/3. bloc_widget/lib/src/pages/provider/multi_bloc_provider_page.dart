import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_second_bloc.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({super.key});

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {

    // 🔴 BlocProvider 내 2가지의 Bloc을 선언한다면?
    // 아래와 같이 연속으로 child > child로 할당해야 하기 때문에 매우 불편함
    // return BlocProvider(
    //   create: (context) => SampleBloc(),
    //   child: BlocProvider(
    //     create: (context) => SampleSecondsBloc(),
    //     child: SamplePage(),
    //   ),
    // );

    // ✅ MultiBlocProvider
    // 2개 이상의 연속적인 Bloc을 가독성있게 List 형식의 providers를 등록할 수 있음
    // 즉, BlocProvider(create) => SomeBloc을 연속적으로 할당
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => SampleBloc())),
        BlocProvider(create: ((context) => SampleSecondsBloc())),
      ],
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleBloc>().add(SampleEvent());
                    },
                    child: Text('+')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<SampleSecondsBloc>()
                          .add(SampleSecondsEvent());
                    },
                    child: Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
