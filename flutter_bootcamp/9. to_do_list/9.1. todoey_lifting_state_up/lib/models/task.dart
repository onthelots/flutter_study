
// ✅ Model (Task)
class Task {
  // property
  final String name;
  bool isDone;

  //initalizer
  Task({required this.name, this.isDone = false});

  // toggle method
  void toggleDone() {
    isDone = !isDone;
  }
}