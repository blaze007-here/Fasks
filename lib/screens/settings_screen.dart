import 'package:fasks/data/notifiers.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appearance",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text("Dark mode or Light mode", style: TextStyle(fontSize: 20)),
                SizedBox(width: 80),
                IconButton(
                  onPressed: () async {
                    isDarkModeNotifier.value = !isDarkModeNotifier.value;
                  },
                  icon: ValueListenableBuilder(
                    valueListenable: isDarkModeNotifier,
                    builder: (context, isDarkMode, child) {
                      return Icon(
                        isDarkMode ? (Icons.light_mode) : Icons.dark_mode,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
             children: [
                Text("Task Reminders", style: TextStyle(fontSize: 20),),
                SizedBox(width: 155),
                Switch.adaptive(
                  value: isSwitch,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitch = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
