class TaskModel {
  String title;
  String description;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
