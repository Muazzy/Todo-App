import 'package:flutter/material.dart';
import 'package:my_todo/constants.dart';
import 'package:my_todo/screens/add_task.dart';
import 'package:my_todo/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0x7FFc7a8ee),
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: AddTask(),
                );
              });
        },
      ),
      body: SafeArea(
        //a big container that contains our bg image
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'images/bg.png',
            ),
            fit: BoxFit.cover,
          )),
          //inside that container there is our task list.
          child: Column(
            children: [
              //to make our bg image show up we have created a invisible container
              Expanded(
                flex: 2,
                child: Container(),
              ),
              //this is the main container which contains taskList and username+pic etc
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  decoration: kTaskListBoxDecoration,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hi, Muazzam 👋',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                              ),
                            ),
                            CircleAvatar(
                              radius: 23,
                              backgroundImage:
                                  AssetImage('images/circleAv.png'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 8,
                        child: TaskList(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
