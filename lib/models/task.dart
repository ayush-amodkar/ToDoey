import 'package:flutter/material.dart';

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void togglleDone() {
    isDone = !isDone;
  }
}
