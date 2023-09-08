import 'package:flutter/material.dart';
import 'package:flutter_firebase_project4/Services/firestore_services.dart';

import '../Model/model.dart';
import 'todo_list.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  TextEditingController _addtodoController = TextEditingController();
  Firebase_Operations op = Firebase_Operations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://media.cntraveler.com/photos/5dfba7a9abf9dc0008b282ce/master/w_1920%2Cc_limit/solo-vacations-Iceland-GettyImages-530101022.jpg'),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Center(
            child: Stack(
              children: [
                const SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        "Todos",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TodoList(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, -1),
                                  blurRadius: 10,
                                ),
                              ]),
                          child: TextField(
                            controller: _addtodoController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add Todo here",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, -1),
                                blurRadius: 10,
                              ),
                            ]),
                        child: IconButton(
                          onPressed: () {
                            todo_class todo = todo_class(
                                id: DateTime.now().toString(),
                                title: _addtodoController.text,
                                isDone: false);
                            op.addTodo(todo);
                            _addtodoController.clear();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
