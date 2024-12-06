import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocListenerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  late SampleBloc sampleBloc;

  // showMessage (showDialog)
  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),

          // builder
          content: BlocBuilder<SampleBloc, int>(

            // 📌 트리구조 밖이므로, bloc을 지정
            bloc: sampleBloc,
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

        /// ✅ BlocListener
        /// - 상태변화에 따른 '이벤트 처리'만 실시할 때 필요한 Widget
        /// 👉🏻 child 위젯은 re-build가 발생되지 않음!
        // child: BlocListener<SampleBloc, int>(
        //
        //   /// 🟢 listenWhen : state에 대한 값을 기반으로, listener가 실행되는 조건을 할당
        //   listenWhen: (previous, current) => current > 5,
        //
        //   /// 🟢 listner : state값이 변경되거나, 혹은 listenWhen의 조건식에 의해 showAlert 혹은 Bloc간의 통신을 실시함
        //   listener: (context, state) {
        //     _showMessage(context);
        //   },
        //
        //   // 🚫 child의 값은 변경되지 않음
        //   // 만약, 변경코자 한다면 여기서 다시 BlocBuilder로 감싸서 활용할 것
        //   child: Text(
        //     context.read<SampleBloc>().state.toString(),
        //     style: const TextStyle(fontSize: 70),
        //   ),
        // ),

        /// 🖐🏻 그렇다면, Listener가 아닌 'Builder'를 통해 Alert 메세지를 띄우면 되는거 아닌가?
        /// 아래와 같이, Listener + Builder를 통해 이벤트 처리 및 UI 업데이트를 모두 진행할 수도 있음
        child: BlocListener<SampleBloc, int>(
          listenWhen: (previous, current) => current > 5,
          listener: (context, state) {
            _showMessage(context);
          },
          child: BlocBuilder<SampleBloc, int>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: TextStyle(fontSize: 70),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
