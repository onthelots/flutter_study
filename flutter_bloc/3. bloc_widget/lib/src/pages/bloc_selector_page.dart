import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/bloc_selector_bloc.dart';

class BlocSelectorPage extends StatefulWidget {
  const BlocSelectorPage({super.key});

  @override
  State<BlocSelectorPage> createState() => _BlocSelectorPageState();
}

class _BlocSelectorPageState extends State<BlocSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
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

            // ✅ BlocSelctor
            // - Bloc의 상태 중, '필요한 부분만 선택적으로 필터링' 후, 변경에 도움을 줌

            // 👉🏻 3가지의 제네릭 타입을 선언해야 하는데..
            // 1) Bloc
            // 2) State
            // 3) 선택적으로 가져올 값의 타입 ⭐
            BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(

              // 👉🏻 selector : 무슨 값을 선택적으로 선언할건데?
              // - 위에서 3번째 제네릭 타입으로 설정한 값, 즉 state를 다시 한번 선언해주고,
              selector: (state) => state.changeState, // filter 역할

              // builder를 통해 해당 state 값을 활용
              builder: (context, state) {
                print('selector builder -> Change State');
                return Icon(
                  Icons.favorite,
                  color: state ? Colors.red : Colors.grey,
                  size: 50,
                );
              },
            ),

            // ✅ BlocBuilder
            BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
              // current.changeState의 값이 변경되었을 때,
              // buildWhen: (previous, current) => current.changeState, // 조건문 역할
              builder: (context, state) {
                print('bloc builder -> Text');
                return Text(
                  // state.value의 값을 기반으로 UI re-build를 실시함
                  state.value.toString(),
                  style: const TextStyle(fontSize: 70),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // ChangeStateEvent
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                      // - 🚫 만약, 여기서 changeState값을 변경하는 이벤트를 실행하게 되면?
                      // BlocBuilder 또한 BlocSelectorState를 참조하고 있으므로, 트리거 되어 'bloc builder'가 실행됨
                    },
                    child: Text('상태변경')),

                const SizedBox(width: 15),

                // ValueEvent
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ValueEvent());
                    },
                    child: Text('더하기')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
