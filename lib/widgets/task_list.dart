import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  final GlobalKey<TaskListState> key;

  TaskList({required this.key}) : super(key: key);

  @override
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(tasks[index].title),
          onDismissed: (direction) {
            setState(() {
              tasks.removeAt(index);
            });
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
            title: Text(tasks[index].title),
            subtitle: Text('Deadline: ${tasks[index].deadline.toString()}'),
          ),
        );
      },
    );
  }
}
