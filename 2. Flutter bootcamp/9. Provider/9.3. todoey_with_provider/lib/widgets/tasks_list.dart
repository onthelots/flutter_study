import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task_list.dart';
import 'package:provider/provider.dart';

// Task ListVie
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskList>(
      builder: (context, taskList, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskList.tasks[index];
            return Dismissible(
              key: Key(task.name!), // 유니크한 키를 사용해야 함 (여러개가 존재할때)
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              direction: DismissDirection.endToStart, // 오른쪽에서 왼쪽으로 스와이프
              onDismissed: (direction) {
                // 스와이프하여 삭제
                taskList.deleteTask(task);
                // 삭제 후 알림
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${task.name} has been deleted')),
                );
              },
              child: TaskTile(
                taskTitle: task.name ?? 'Empty Tasks',
                isChecked: task.isDone,
                checkboxCallBack: (bool? checkboxState) {
                  taskList.updateTask(task);
                },
                onLongPress: () {
                  _showDeleteConfirmationDialog(context, task, taskList);
                },
              ),
            );
          },
          itemCount: taskList.taskCount,
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Task task, TaskList taskList) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Task?'),
          content: Text('Are you sure you want to delete "${task.name}"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                taskList.deleteTask(task);
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}