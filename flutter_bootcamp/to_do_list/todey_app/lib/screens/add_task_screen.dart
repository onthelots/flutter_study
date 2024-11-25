import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w600,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
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
            ),
            SizedBox(height: 20.0),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                minimumSize: Size(100, 50), // 가로 100, 세로 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: Text('Add'),
              onPressed: () {
                // Add task logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}