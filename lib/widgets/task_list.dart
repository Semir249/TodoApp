import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile.dart';
import '../models/task.dart';
import '../provider/providers.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<TaskProvider>(context);
    return ListView.builder(
      itemCount: data.task.length,
      itemBuilder: (context, index) => TaskTile(
        name: data.task[index].name,
        isChecked: data.task[index].isDone,
        toggle: (value) {
          data.task[index].toggle();

          data.remainingTask();
        },
        remove: () {
          data.removeTask(data.task[index]);
        },
      ),
    );
  }
}
