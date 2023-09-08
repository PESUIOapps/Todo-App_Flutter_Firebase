import 'package:flutter/material.dart';
import 'package:flutter_firebase_project4/Services/firestore_services.dart';

import '../../Model/model.dart';

class Todo extends StatefulWidget {
  final todo_class todo;
  const Todo(
    this.todo, {
    super.key,
  });

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final Firebase_Operations _controller = Firebase_Operations();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.isDone!,
          onChanged: (value) {
            widget.todo.isDone = value ?? false;
            _controller.updateTodo(widget.todo);
          },
        ),
        title: Text(
          widget.todo.title!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            decoration: widget.todo.isDone! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          color: Colors.red,
          icon: const Icon(Icons.delete),
          onPressed: () {
            _controller.delete(widget.todo.id!);
          },
        ),
      ),
    );
  }
}
