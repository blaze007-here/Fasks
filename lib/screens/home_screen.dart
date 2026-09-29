  import 'package:fasks/screens/add_task_screen.dart';
  import 'package:fasks/screens/completed_screen.dart';
  import 'package:fasks/screens/settings_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:fasks/models/task.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

  class _HomeScreenState extends State<HomeScreen> {
    int selectedFilter = 0;
    int selectedBottomNav = 0;

    List<Task> tasks = [];

    @override
    Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;

      return Scaffold(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good evening,",
                          style: TextStyle(
                            color: colors.primary,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          "User 👋",
                          style: TextStyle(
                            color: colors.primary,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          "5 tasks remaining",
                          style: TextStyle(color: colors.primary, fontSize: 18),
                        ),
                      ],
                    ),

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: colors.primary,
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
                    color: colors.surfaceContainer,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: colors.primary),
                  ),
                  child: TextField(
                    style: TextStyle(color: colors.onSurface),
                    decoration: InputDecoration(
                      hintText: "Search tasks...",
                      hintStyle: TextStyle(
                        color: colors.onSurface.withValues(alpha: 0.6),
                      ),
                      prefixIcon: Icon(Icons.search, color: colors.primary),
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
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      // tasks[index].isCompleted = !tasks[index].isCompleted;
                      return Row(
                        children: [
                          Text(
                            tasks[index].title,
                            style: TextStyle(
                              color: colors.onSurface,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                tasks[index].isCompleted =
                                    !tasks[index].isCompleted;
                              });
                            },
                            icon: Icon(
                              tasks[index].isCompleted
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final task = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddTaskScreen();
                },
              ),
            );
            if (task != null) {
              setState(() {
                tasks.add(task);
              });
            }
          },
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 30),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedBottomNav,

          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return (HomeScreen());
                  },
                ),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return (CompletedScreen());
                  },
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return (SettingsScreen());
                  },
                ),
              );

              setState(() {
                selectedBottomNav = index;
              });
            }
          },

          type: BottomNavigationBarType.fixed,

          backgroundColor: colors.surface,

          selectedItemColor: colors.primary,

          unselectedItemColor: colors.onSurface.withValues(alpha: 0.5),

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
      final colors = Theme.of(context).colorScheme;
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
              color: selected ? colors.primary : colors.surfaceContainer,

              borderRadius: BorderRadius.circular(20),

              border: Border.all(color: colors.primary),
            ),

            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: selected ? colors.onPrimary : colors.primary,

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
