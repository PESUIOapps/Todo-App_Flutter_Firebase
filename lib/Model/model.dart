class todo_class {
  String? id;
  String? title;
  bool? isDone;

  todo_class({required this.id, required this.title, this.isDone = false});
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
      };
  factory todo_class.fromJson(Map<String, dynamic> json) {
    return todo_class(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isDone: json['isDone'] as bool?,
    );
  }
}
