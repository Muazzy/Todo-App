import 'package:flutter/material.dart';
import 'package:my_todo/constants.dart';
import 'package:my_todo/models/tasks.dart';
import 'package:my_todo/tasks_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _mycontroller = TextEditingController();
    return Container(
      //transparent color
      padding: MediaQuery.of(context).viewInsets,
      color: Color(0xff757575),
      child: Container(
        decoration: kTaskListBoxDecoration,
        padding: EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple.shade800,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            //for spacing
            SizedBox(height: 20.0),
            //textfield
            TextField(
              cursorColor: Colors.purple.shade800,
              autofocus: true,
              controller: _mycontroller,
              decoration: kTextfieldDecoration,
              //this will do the same as our below 'add' button.
              onSubmitted: (tap) {
                Task newTask = Task(name: _mycontroller.text);
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              },
            ),

            //for spacing
            SizedBox(height: 20.0),
            //add button
            ElevatedButton(
              style: buttonStyleDecoration,
              onPressed: () {
                Task newTask = Task(name: _mycontroller.text);
                Provider.of<TaskData>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                  fontSize: 19.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
