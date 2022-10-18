import 'package:flutter/material.dart';
import 'package:mobile_form/core/models/task_model.dart';

class Tasklist with ChangeNotifier {
  final List<Task> _taskList = [];

  get taskList => _taskList;

  void addNewTask(String inputTodo) {
    _taskList.add(Task(name: inputTodo, status: false));
    notifyListeners();
  }
}
