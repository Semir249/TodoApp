import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked;
  final String name;
  final Function toggle;
  final Function remove;
  TaskTile({this.name, this.isChecked, this.toggle, this.remove});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Delete Task'),
            content: Text('Are you sure you want to delet this task'),
            actions: [
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  remove();
                  Navigator.of(ctx).pop();
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      },
      title: Text(
        name,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toggle,
      ),
    );
  }
}
