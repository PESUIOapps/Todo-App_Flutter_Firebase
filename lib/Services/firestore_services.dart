import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/model.dart';

// ignore: camel_case_types
class Firebase_Operations {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  Future<void> addTodo(todo_class todo) async {
    await _instance.collection('Todos').add(todo.toJson());
  }

  Future<void> delete(String? id) async {
    try {
      await _instance.collection("Todos").doc(id).delete();
    } catch (e) {
      //basically this is ur error handling part of the code
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> updateTodo(todo_class todo) async {
    await _instance.collection('Todos').doc(todo.id).update(todo.toJson());
  }
}
