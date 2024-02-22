import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/task_manager_model.dart';

class TaskManagerController with ChangeNotifier {
  List<TaskManagerModel> tasks = [];
  var box = Hive.box('taskDb');

  void addTask(TaskManagerModel taskManagerModel) async {
    tasks.add(taskManagerModel);
    await box.put('TASKDB', tasks);
    notifyListeners();
  }

  void deleteIteam(int index) async {
    tasks.removeAt(index);
    await box.put('TASKDB', tasks);
    notifyListeners();
  }

  void getData() {
    final List demo = box.get('TASKDB');
    tasks = demo.map((e) {
      return TaskManagerModel(
          date: e.date, taskname: e.taskname, discription: e.discription);
    }).toList();
  }
}