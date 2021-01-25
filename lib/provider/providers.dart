import 'package:flutter/foundation.dart';

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _task = [Task(name: 'Do Homework')];
  int _remaining = 1;
  List<Task> get task {
    return [..._task];
  }

  void addTask(String name) {
    _task.add(Task(name: name));
    remainingTask();
    notifyListeners();
  }

  void remainingTask() {
    _remaining =
        _task.where((element) => element.isDone == false).toList().length;
    notifyListeners();
  }

  int get remaining {
    return _remaining;
  }

  void toggle(String name) {
    Task(name: name).toggle();

    notifyListeners();
  }

  void removeTask(Task task) {
    _task.remove(task);
    remainingTask();
    notifyListeners();
  }
}
