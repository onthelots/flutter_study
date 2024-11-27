import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {

  late String newTaskTitle;
  late final Function addTaskCallback;

  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Type your task...',
                hintStyle: TextStyle(
                  color: Color(0xff757575),
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
              onChanged: (value) {
                this.newTaskTitle = value;
              },
            ),
            const SizedBox(height: 20.0),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                minimumSize: Size(100, 50), // 가로 100, 세로 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: const Text('Add'),
              onPressed: () {
                this.addTaskCallback(this.newTaskTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}