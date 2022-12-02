import 'package:flutter/material.dart';
import 'package:todo_getx/Controller/todo_controller.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Model/todo.dart';

class TodoEdit extends StatelessWidget {
  // const TodoEdit({Key? key}) : super(key: key);
  final int index;
  TodoEdit({required this.index});
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index].title);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Todo',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [Icon(Icons.calendar_today)],
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 25,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 10,
                          shadowColor: Colors.pinkAccent),
                      onPressed: () {
                        Get.back();
                      }),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          elevation: 10,
                          shadowColor: Colors.pinkAccent),
                      onPressed: () {
                        var editing = todoController.todos[index];
                        editing.title = textEditingController.text;
                        todoController.todos[index] = editing;

                        Get.back();
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
