import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [];

  // 🟢 일반적인 getter를 통한 private 객체 접근 방식
  // 이렇게 되면, 실제 tasks.add와 같은 메서드를 통해 🚫간접적으로 _tasks의 값을 수정하거나 변경🚫시킬 수 있음
  // List<Task> get tasks => _tasks;

  // 🟢 UnmodifiableListView을 통한 데이터의 무결성 보호
  // 단순한 List 타입의 getter가 아닌, UnmodifiableListView 타입 getter를 실시하게 되면
  // 클래스 내부의 메서드만을 활용하여 _tasks로 진입 후 데이터를 변경시킬 수 있음
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // taskListCount
  int get taskCount {
    return _tasks.length;
  }

  // add Task
  void addTask(String newTitle) {
    _tasks.add(Task(newTitle, false));
    notifyListeners();
  }

  // toggleTask Done
  void updateTask(Task task) {
    task.toggleDone(); // UI 갱신을 위해, Provider인 TaskList를 참조하여 업데이트를 실시해야 함
    notifyListeners();
  }

  // delete Task
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
