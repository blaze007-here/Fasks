import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Task Details"))
    // the title of the task,
      //description
      //due date
      //priority
      //status (completed or not)
      //mark complete or not
      //edit task
        );
  }
}
