import 'package:flutter/material.dart';

BoxDecoration kTaskListBoxDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(35.0),
    topRight: Radius.circular(35.0),
  ),
);

ButtonStyle buttonStyleDecoration = ElevatedButton.styleFrom(
  primary: Color(0x7FFc7a8ee),
  // minimumSize: Size(100, 35),

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(
      color: Colors.purple.shade100,
    ),
  ),
  padding: EdgeInsets.all(10),
);

InputDecoration kTextfieldDecoration = const InputDecoration(
  hintText: 'Task name',
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.amber,
    ),
  ),
);
