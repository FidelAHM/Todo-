import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Controller/todo_controller.dart';
import 'package:todo_getx/Model/todo.dart';
import 'package:todo_getx/screens/edit_todo.dart';
import 'package:todo_getx/screens/todo_screen.dart';

class TodoHome extends StatelessWidget {
  // const TodoHome({Key? key}) : super(key: key);
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          Get.to(() => TodoScreen());
        },
      ),
      body: Container(child: Obx(
        () {
          return ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete),
                    ),
                    key: UniqueKey(),
                    onDismissed: (_) {
                      todoController.todos.removeAt(index);
                      Get.snackbar(
                          "Removed Successfully", "You deleted this task",
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: ListTile(
                      title: Text(todoController.todos[index].title,
                          style: todoController.todos[index].done
                              ? TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough)
                              : TextStyle(color: Colors.green, fontSize: 20)),
                      onTap: () {
                        Get.to(TodoEdit(
                          index: index,
                        ));
                      },
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.pinkAccent,
                      ),
                      leading: Checkbox(
                        value: todoController.todos[index].done,
                        onChanged: (newValue) {
                          var todo = todoController.todos[index];
                          todo.done = newValue!;
                          todoController.todos[index] = todo;
                        },
                      ),
                    ),
                  ),
              separatorBuilder: (context, pos) => Divider(),
              itemCount: todoController.todos.length);
        },
      )),
    );
  }
}
