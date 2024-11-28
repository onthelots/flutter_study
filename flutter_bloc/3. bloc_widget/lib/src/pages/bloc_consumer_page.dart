import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_widget_sample/src/bloc/sample_bloc.dart';

class BlocConsumerPage extends StatefulWidget {
  const BlocConsumerPage({super.key});

  @override
  State<BlocConsumerPage> createState() => _BlocConsumerPageState();
}

class _BlocConsumerPageState extends State<BlocConsumerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {

  // showMesage
  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Title'),
          content: const Text('Dialog Content'),
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
    return Scaffold(
      body: Center(

        /// ✅ BlocConsumer >
        /// BlocBuilder + BlocListener 모두 활용 가능!

        child: BlocConsumer<SampleBloc, int>(

          /// 🟢 Listener
          listenWhen: (previous, current) => current > 5, // 6 이상이 될때, listener 실행
          listener: (context, state) {
            _showMessage(context);
          },

          /// 🟢 Builder
          buildWhen: (previous, current) => current % 2 == 0, // 짝수일 경우에만 UI re-build !
          builder: (context, state) => Text(
            state.toString(),
            style: const TextStyle(fontSize: 70),
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
