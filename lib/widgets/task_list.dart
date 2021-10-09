import 'package:flutter/material.dart';
import 'package:my_todo/tasks_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<TaskData>(context).taskCount == 0
        ? Center(
            child: Text(
              "Tap the '➕' button to add tasks",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        : Consumer<TaskData>(
            //this consumer widget is very useful to provide
            builder: (context, taskData, index) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final currentTask = taskData.tasks[index];

                  return TaskTile(
                    deleteTask: () {
                      Provider.of<TaskData>(context, listen: false)
                          .deleteTask(currentTask);
                    },
                    taskname: currentTask.name,
                    isDone: currentTask.isDone,
                    changeCheckboxState: (tap) {
                      taskData.updateCheckBox(currentTask);
                    },
                  );
                },
                itemCount: Provider.of<TaskData>(context).taskCount,
              );
            },
          );
  }
}
