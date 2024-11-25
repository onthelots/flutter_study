import 'package:flutter/material.dart';
import 'task_tile.dart';

// Task ListVie
class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ✅ ListTile : 재 사용 가능한 ListView의 childen (== reusable)
        TaskTile(),
      ],
    );
  }
}