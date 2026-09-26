import 'package:fasks/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fasks"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Lottie.asset("lib/assets/lottie/Checklist.json"),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  textAlign: TextAlign.center,
                  "Your Tasks",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  textAlign: TextAlign.center,
                  "Your Focus",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text("DO tasks"),
            ),
          ],
        ),
      ),
    );
  }
}
