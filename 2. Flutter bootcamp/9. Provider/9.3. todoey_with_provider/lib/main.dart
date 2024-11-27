import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/models/task_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // 1) Provider 선언 (Task 타입)
    return ChangeNotifierProvider<TaskList>(
      create: (context) => TaskList(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}


