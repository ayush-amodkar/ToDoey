import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen();
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController newTaskTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.lightBlue.shade300,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: newTaskTitle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlue.shade300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // print(newTaskTitle);
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle.text);
                Navigator.of(context).pop(newTaskTitle.text);
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 45)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlue.shade300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
