import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'task_tile.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = TaskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (checkBoxState) {
                TaskData.updateTask(task);
              },
              longPressCallback: () {
                print('hello');
                TaskData.removeTask(task);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}

  // return ListView(
    //   children: <Widget>[
    //     TaskTile(isChecked: false, taskTitle: tasks[0].name),
    //     TaskTile(isChecked: false, taskTitle: tasks[1].name),
    //   ],
    // );