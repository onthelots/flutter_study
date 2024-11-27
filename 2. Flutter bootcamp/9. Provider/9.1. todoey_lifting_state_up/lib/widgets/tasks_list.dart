import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

// Task ListVie
class TasksList extends StatefulWidget {

  // Task model property
  List<Task> tasks = [];
  Function? voidCallback;

  TasksList({required this.tasks, this.voidCallback});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    // ✅ ListView builder (ListView의 하위 위젯을 설정할 시 활용)
    // {required Widget? Function(BuildContext, int) itemBuilder}
    // context, index 2가지 인자를 반환함
    // 반환하는 Widget은 dynamic
    return ListView.builder(

      // 👉🏻 item Builder (어떤 item, widget을 List에 나타낼 것인지 할당하는 방식)
      // context는 현재 '어느'위젯 트리에 속해있는지 확인을 해야 하며,
      // index는 item의 index값을 나타냄
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: () {
            setState(() {
              widget.tasks[index].toggleDone(); // model task 내부에서 toggle 메서드를 실행 > re-build 시작
            });
          }
        );
      },

      // 👉🏻 item Count (해당 List에 나타나게 될 item의 갯수)
      itemCount: widget.tasks.length,
    );
  }
}