import 'package:flutter/material.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Completed Tasks",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "12 tasks completed",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          Card(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TASK 1",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("the description", style: TextStyle(fontSize: 18)),
                ],
              // i want to add more tasks cards
              ),
            ),
          ),
        ],
      ),
    );
  }
}
