import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/Controller/todo_controller.dart';
import 'package:todo_getx/Model/todo.dart';

class TodoScreen extends StatelessWidget {
  // const TodoScreen({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo',
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
                hintText: "what do you want to accomplish?",
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
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          elevation: 10,
                          shadowColor: Colors.pinkAccent),
                      onPressed: () {
                        todoController.todos
                            .add(Todo(title: textEditingController.text));
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
