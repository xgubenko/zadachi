import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_task_manager/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  static SharedPreferences? localStorage;

  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  void saveListToSharedPreferences(List<Task> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> serializedList = list.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('tasks', serializedList);
  }

  Future<List<Task>> getListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? serializedList = prefs.getStringList('tasks');
    if (serializedList == null) return [];
    return serializedList.map((item) => Task.fromJson(json.decode(item))).toList();
  }

  List<Task> _tasks = [
    Task(name: 'Не забыть поесть'),
  ];

  Future<void> initDataFromSharedPreferences() async {
    List<Task>? data = await getListFromSharedPreferences();
    if (data != null) {
      _tasks = data;
      notifyListeners();
    }
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    saveListToSharedPreferences(tasks);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    saveListToSharedPreferences(tasks);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    saveListToSharedPreferences(tasks);
    notifyListeners();
  }
}
