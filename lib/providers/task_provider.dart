import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(title: 'Buy milk', description: 'Buy 2L of milk'), //0
    TaskModel(title: 'Buy eggs', description: 'Buy 12 eggs'), // 1
    TaskModel(title: 'Buy bread', description: 'Buy 2 loaves of bread'),
  ];

  List<TaskModel> get tasks => _tasks;

  void addTask({required String title, required String description}) {
    final task = TaskModel(title: title, description: description);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleStatus(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
