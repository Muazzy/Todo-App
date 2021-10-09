import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:my_todo/models/tasks.dart';
import 'db_helper.dart';

class TaskData extends ChangeNotifier {
  static DBHelper dbhelper = DBHelper();

  List<Task> _tasks = [];

  void getTasks() async {
    //here we have again used notifyLitsners cuz aise hii app start
    //hone mein tasks show nhi horhe tha.
    _tasks = await dbhelper.getTaskList();
    notifyListeners();
  }

  TaskData() {
    getTasks();
  }

  int get taskCount {
    return _tasks.length;
  }

  //this way we can not fuck up our task list data and can also provide this data without any problem
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateCheckBox(Task task) {
    task.toggleIsDone();
    notifyListeners();
    dbhelper.updateTask(task);
  }

  void addTask(Task task) {
    dbhelper.insertTask(task).then((id) {
      task.id = id;
      _tasks.add(task);

      notifyListeners();
    });
  }

  void deleteTask(Task task) {
    dbhelper.deleteTask(task.id).then((id) {
      _tasks.remove(task);
      notifyListeners();
    });
  }
}
