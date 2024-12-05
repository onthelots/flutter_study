import 'package:count_state_manage_sample/src/bloc/count_bloc.dart';
import 'package:count_state_manage_sample/src/cubit/count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHome extends StatelessWidget {
  const BlocHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc상태관리')),
      body: Center(

        /// BlocBuilder
        child: BlocBuilder<CountBloc, int>(
          builder: (context, state) {
            return Text(
              // state 값 Text화
              state.toString(),
              style: TextStyle(fontSize: 80),
            );
          },
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          /// Event 1 : AddCountEvent
          /// read, add를 통해 Event handler에 Task를 넘김
          FloatingActionButton(
            onPressed: () {
              context.read<CountBloc>().add(AddCountEvent());
            },
            child: Icon(Icons.add),
          ),

          const SizedBox(width: 30),

          /// Event 1 : SubstractCountEvent
          /// read, add를 통해 Event handler에 Task를 넘김
          FloatingActionButton(
            onPressed: () {
              context.read<CountBloc>().add(SubstractCountEvent());
            },
            backgroundColor: Colors.red,
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}
