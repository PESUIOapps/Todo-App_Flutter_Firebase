import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../Model/model.dart';
import 'widgets/todo_item.dart';
import '../Services/firestore_services.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Firebase_Operations op = Firebase_Operations();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Todos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final todos = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return todo_class.fromJson({
            'id': doc.id,
            'title': data['title'],
            'isDone': data['isDone'],
          });
        }).toList();
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todos.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Todo(todo);
            });
      },
    );
  }
}
