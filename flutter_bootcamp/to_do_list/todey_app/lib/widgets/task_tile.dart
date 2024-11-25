import 'package:flutter/material.dart';

// TaskTile
class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  // 5) 해당 콜백함수가 호출되는 시점은 사용자가 체크박스를 클릭했을 때 실행되는 값을 재 할당함 (setState)
  void checkboxCallback (bool? checkboxState) {
    print("checkboxCallback 호출됨, checkboxState: $checkboxState");
    // 6) setState, 즉 Flutter가 해당 위젯을 다시 rebuild하여 UI를 새로 그리기 시작함
    setState(() {
      print("setState 호출됨, isChecked 업데이트: $checkboxState");
      isChecked = checkboxState ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("TaskTile build 호출됨");

    return ListTile(
        title: Text(
          'This is a task',
          style: TextStyle(
            // 7) isChecked값이 변경되어, UI가 변경됨
            decoration: isChecked ? TextDecoration.lineThrough : null
          ),
        ),
      trailing: TaskCheckBox(
        // 7) isChecked값이 변경되어, UI가 변경됨
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

// TaskCheckBox (stl widget)
class TaskCheckBox extends StatelessWidget {

  final bool checkboxState;
  final Function(bool?) toggleCheckboxState;

  // 1) TaskCheckBox는 StatelessWidget으로 상태를 가지지 않고, 상위 위젯에서 전달받은 값을 사용함
  const TaskCheckBox({super.key, required this.checkboxState, required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    print("TaskCheckBox build 호출됨");

    // 2) TaskCheckBox 위젯의 build 메서드가 호출됨
    // 이때, checkboxState가 전달되어 체크박스의 상태를 설정함
    return Checkbox(
      value: checkboxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: (newValue) {
        print("Checkbox onChanged 호출됨, newValue: $newValue");
        // 4) 사용자가 체크박스를 클릭하면 onChanged가 호출되며 -> 이는 TaskTile의 checkboxCallBack을 실행하게 됨
        toggleCheckboxState(newValue);
      }
    );
  }
}
