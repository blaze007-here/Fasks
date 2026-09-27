import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Tasks"), centerTitle: true),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            Text(
              "Task title",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Enter the title for the task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Description (optional)",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Enter the task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Due Date",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Enter the date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Priority",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Enter the priority",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text("Add Task"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
