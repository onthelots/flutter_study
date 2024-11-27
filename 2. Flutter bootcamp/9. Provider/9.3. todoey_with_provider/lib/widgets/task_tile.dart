import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';

// TaskTile
class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallBack;
  final void Function()? onLongPress;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallBack,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallBack,
      ),
      onLongPress: onLongPress,
    );
  }
}
