import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/Model/todo.dart';

class TodoController extends GetxController {
  // var todos = List<Todo>().obs;
  var todos = <Todo>[].obs;
  @override
  void onInit() {
    List StoredTodos = GetStorage().read('todos');
    if (StoredTodos != null) {
      todos = StoredTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
