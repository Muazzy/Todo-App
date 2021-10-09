class Task {
  int id;
  String name;
  // this is'nt final cuz it can change according to user. i.e we can check and uncheck a task
  bool isDone;
  //tasks will be defaultly unDone;
  //we cant just set bool isDone to false here but rather we set it to false while initializing
  Task({this.id, this.name, this.isDone = false});

  void toggleIsDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'isDone': isDone};
  }
}
