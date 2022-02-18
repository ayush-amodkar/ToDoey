import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  bool isChecked;
  Function checkBoxCallBack;
  Function longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkBoxCallBack,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        longPressCallback();
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlue.shade300,
        value: isChecked,
        onChanged: (value) {
          checkBoxCallBack(value);
        },
      ),
    );
  }
}
