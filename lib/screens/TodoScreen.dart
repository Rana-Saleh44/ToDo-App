import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_list.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final GlobalKey<TaskListState> _taskListKey = GlobalKey<TaskListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'Task Name',
            ),
          ),
          TextField(
            controller: _deadlineController,
            decoration: InputDecoration(
              labelText: 'Deadline (YYYY-MM-DD)',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty &&
                  _deadlineController.text.isNotEmpty) {
                Task newTask = Task(
                  title: _taskController.text,
                  deadline: DateTime.parse(_deadlineController.text),
                );
                _taskListKey.currentState!.addTask(newTask);
                _taskController.clear();
                _deadlineController.clear();
              }
            },
            child: Text('Add Task'),
          ),
          Expanded(
            child: TaskList(key: _taskListKey),
          ),
        ],
      ),
    );
  }
}
