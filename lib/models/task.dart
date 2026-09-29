  class Task {
    String id;
    String title;
    String? description;
    DateTime? dueDate;
    String priority;
    bool isCompleted;

    Task({
      required this.id,
      required this.title,
      this.description,
      required this.dueDate,
      required this.priority,

      this.isCompleted = false,
    });
  }
