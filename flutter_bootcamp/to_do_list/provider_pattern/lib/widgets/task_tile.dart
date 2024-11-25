import 'package:flutter/material.dart';

// TaskTile
class TaskTile extends StatelessWidget {
  late final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;

  TaskTile({this.isChecked = false, required this.taskTitle, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        this.taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (bool? newValue) {
          checkboxCallback(); // 체크박스 값이 변경되면 콜백 실행
        },
      ),
    );
  }
}
