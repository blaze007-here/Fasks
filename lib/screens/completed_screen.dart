import 'package:flutter/material.dart';
import 'package:fasks/models/task.dart';

class CompletedScreen extends StatefulWidget {
  final List<Task> tasks;

  const CompletedScreen({super.key, required this.tasks});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    final completedTasks = widget.tasks
        .where((task) => task.isCompleted)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Completed Tasks",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Text(
            "${widget.tasks.where((tasks) {
              return tasks.isCompleted;
            }).length} completed",
          ),

          SizedBox(height: 30),

          Expanded(
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          completedTasks[index].title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                            completedTasks[index].description!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
