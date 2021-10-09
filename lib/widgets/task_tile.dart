import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskname;
  final Function changeCheckboxState;
  final bool isDone;
  final Function deleteTask;

  TaskTile({
    this.taskname,
    this.changeCheckboxState,
    this.isDone,
    this.deleteTask,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
      title: Text(
        taskname,
        style: TextStyle(
          fontSize: 17,
          fontWeight: isDone ? FontWeight.w300 : FontWeight.w600,
          decoration: isDone
              ? TextDecoration.lineThrough
              : null, //when a task is checked
        ),
      ),
      leading: Transform.scale(
        scale: 1.6,
        child: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          checkColor: Colors.white,
          activeColor: Color(0x7FFb1e5ce),
          value: isDone,
          onChanged: changeCheckboxState,
        ),
      ),
    );
  }
}
