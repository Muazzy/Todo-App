import 'package:flutter/material.dart';
import 'package:my_todo/tasks_data.dart';
import 'package:my_todo/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          unselectedWidgetColor: Color(0x7FFb1e5ce),
          canvasColor: Colors.transparent,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.purple.shade800),
            ),
          ),
        ),
        home: TaskScreen(),
      ),
    );
  }
}
