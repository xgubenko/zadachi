class Task {
  final String name;
  bool isDone;

  Task({this.name = "", this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(name: jsonData['name'], isDone: jsonData['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }
}
