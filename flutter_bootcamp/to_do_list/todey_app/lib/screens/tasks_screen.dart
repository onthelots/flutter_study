import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      // Floating Button
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // ✅Bottom Sheet - modal
          // context : 현재 context
          // builder : Widget build function 형태. statless Widget이나, Stateful Widget을 그리는 리턴타입과 동일
          showModalBottomSheet(
            context: context,

            // ✅ 키보드가 위젯을 가리는 문제가 발생! 비상
            isScrollControlled: true, // 키보드에 반응하도록 설정

            // 👉🏻 SingleChildScrollView : 자식 위젯이 스크롤 가능하도록 만드는 위젯
            // 만약, 내부의 콘텐츠가 화면의 높이를 초과할 경우, 세로 스크롤을 제공함
            builder: (BuildContext context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        }
      ),

      // body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.lightBlueAccent,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                  ), // radius -> CircleAvatar 크기
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '12 Tasks',
                  style: TextStyle(
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              // ✅ Expanded > Container > ListView!
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}