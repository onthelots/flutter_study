import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/models/task_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(builder: (context, taskList, widget) {
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,

        // Floating Button
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            showModalBottomSheet<String>(
              context: context,
              isScrollControlled: true, // 키보드에 반응하도록 설정
              builder: (BuildContext context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
            );
          },
        ),

        // body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 100.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.lightBlueAccent,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                    ), // radius -> CircleAvatar 크기
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${taskList.taskCount} tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 100.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      );
    });
  }
}