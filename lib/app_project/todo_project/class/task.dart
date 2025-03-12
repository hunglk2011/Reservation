class Task {
  final String? id;
  String? task;
  final bool? isCompleted;
  Task({this.id, this.task, this.isCompleted = false});

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['task'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "task": task, "isCompleted": isCompleted};
  }
}
