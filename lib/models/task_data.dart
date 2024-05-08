import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {

  void _saveData(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', _tasks.toString());
  }



  List<Task> _tasks = [
    Task(name: 'Не забыть поесть'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
