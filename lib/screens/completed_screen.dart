import 'package:flutter/material.dart';
import 'package:fasks/models/task.dart';

class CompletedScreen extends StatefulWidget {
  final List<Task> tasks;

  const CompletedScreen({super.key, required this.tasks});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  bool taskDeleted = false;

  @override
  Widget build(BuildContext context) {
    final completedTasks = widget.tasks
        .where((task) => task.isCompleted)
        .toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){
          Navigator.pop(context,taskDeleted);
        },
          icon: const Icon(Icons.arrow_back),
      ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              completedTasks[index].description!,
                              style: const TextStyle(fontSize: 18),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.tasks.remove(completedTasks[index]);
                                  taskDeleted = true;
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
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
