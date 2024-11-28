import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocBuilderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      lazy: false, // false이라면? 초기값을 출력한다!
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  //bloc을 등록해야 사용이 가능한 케이스
  late SampleBloc sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),

          // ✅ BlocBuilder
          // bloc 옵션을 사용하지 않아도 현 context, 그러니까 위젯트리로부터 bloc을 찾아가 state 변화를 감지할 수 있음
          content: BlocBuilder<SampleBloc, int>(

            // 🚫 bloc option
            // 직접 bloc을 지정(주입)하는건데, 이는 특별한 케이스가 아니고서는 사용하지 않아야 함
            // showMessage 메서드는, 실제 context로 접근하는 것이 아니라 '인자'로서 추후 주입될 예정이기 때문에
            // 이와 같은 특이 케이스의 경우에서는 bloc 옵션을 활용, '어떤 bloc을 사용할 것인지?'에 대해 명시할 필요가 있음
            bloc: sampleBloc,
            // 👉🏻 builder
            // BlocBuilder를 통해 감지하는 context, state값을 다룰 수 있도록 2가지 인자를 직접 활용할 수 있음
            // - 이는, 현재 AlertDialog의 content에 담길 BlocBuilder의 Widget을 반환하게 됨 (그러니까, 실제 dialog의 content는 Text)
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          actions: [
            ElevatedButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    sampleBloc = context.read<SampleBloc>();
    return Scaffold(
      body: Center(

        // ✅ BlocBuilder
        child: BlocBuilder<SampleBloc, int>(

          // 👉🏻 buildWhen
          // 상태 변화를 특정 '구간'에서만 re-build 되도록 조건을 할당하는 것.
          // buildWhen: (previous, current) {
          //   // true일 경우만 builder가 호출됨
          //   return current < 10; // 상태가 변화되어, state값이 10이 될 경우(current) UI re-build가 되질 않음
          // },

          // 👉🏻 builder
          builder: (context, state) {
            return Text(
              'index : $state',
              style: const TextStyle(fontSize: 70),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          // 🚫🚫🚫🚫🚫🚫 add는, 즉시 state를 변경하는게 아니다?
          // - 예상대로라면, 여기서 sampleBloc.state가 10 이상일 때 Alert을 띄우고자 하는데,
          // - 실제로 UI상 index가 12가 되서야지 Alert이 나타남

          // 1. add()는 이벤트 큐에 AddSampleEvent 할당함
          sampleBloc.add(AddSampleEvent());

          // 2. 즉시 호출된 sampleBloc.state는 상태가 변경되기 전이므로, 여전히 초기값 0
          print('sampleBloc state : ${sampleBloc.state}');

          // 3. 따라서, 여기서 출력을 해 봤자, 초기값인 0값임
          // 즉, '이벤트'가 종료되어 state가 1이 되었음에도 불구하고, 이전 값을 참조하기 때문에 0->1로 변경됨
          // 이를 해결하기 위해, BlocListener를 통해 변경된 상태값을 감지해야 함

          // 4. 종합하자면, add는 결국 이벤트를 전달하는 용도일 뿐이지, state값을 참조한다고 해서 현재 실제 참조값을 나타내는건 아님 (여긴 builder 외부 이므로)
          if (sampleBloc.state > 10) {
            _showMessage(context);
          }
        },
      ),
    );
  }
}
