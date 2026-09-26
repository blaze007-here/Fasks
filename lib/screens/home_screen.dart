import 'package:fasks/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedFilter = 0;
  int selectedBottomNav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061414),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good evening,",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "User 👋",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 7),

                      Text(
                        "5 tasks remaining",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),


                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: ClipOval(
                      child: Image.asset(
                        "lib/assets/images/img.png",
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff0B2424),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.teal,
                  ),
                ),
                child: const TextField(
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search tasks...",
                    hintStyle: TextStyle(
                      color: Colors.teal,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.teal,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  _filterButton("All", 0),
                  const SizedBox(width: 8),
                  _filterButton("Today", 1),
                  const SizedBox(width: 8),
                  _filterButton("Upcoming", 2),
                ],
              ),

              const SizedBox(height: 18),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 80),
                  children: const [
                    Text("task1"),
                    SizedBox(height: 20,),
                    Text("task2")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTaskScreen(
                );
              },
            ),
          );
        },
        backgroundColor: Colors.teal,
        foregroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNav,

        onTap: (index) {
          setState(() {
            selectedBottomNav = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xff061414),

        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal.shade800,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _filterButton(String title, int index) {
    final selected = selectedFilter == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = index;
          });
        },
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            color: selected
                ? Colors.teal
                : const Color(0xff0B2424),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.teal,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: selected
                    ? Colors.black
                    : Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}