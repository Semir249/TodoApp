import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Task {
  final String name;
  bool isDone = false;
  Task({this.name});

  void toggle() {
    isDone = !isDone;
  }
}
