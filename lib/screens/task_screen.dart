import 'package:flutter/material.dart';
import 'package:my_todo/constants.dart';
import 'package:my_todo/screens/add_task.dart';
import 'package:my_todo/tasks_data.dart';
import 'package:my_todo/widgets/task_list.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic profileP = Provider.of<TaskData>(context).getImage;
    dynamic img = NetworkImage('https://picsum.photos/1080/1920');

    //function that provides a image
    dynamic getImage() {
      if (img == null) {
        img = AssetImage('images/bg.png');
      }
      return img;
    }
    // String imgUrl = 'https://picsum.photos/1080/1920';

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
              image: getImage(),
              fit: BoxFit.cover,
            ),
          ),
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
                            GestureDetector(
                              onTap: () {
                                Provider.of<TaskData>(context, listen: false)
                                    .onTap();
                              },
                              child: CircleAvatar(
                                radius: 23,
                                child: ClipOval(
                                  child: profileP != null
                                      ? Image.file(
                                          profileP,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'images/circleAv.png',
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
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
