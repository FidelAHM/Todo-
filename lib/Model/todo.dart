import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Todo {
  String title;
  bool done;

  Todo({required this.title, this.done = false});
  factory Todo.fromJson(Map<String, dynamic> json) =>
      Todo(title: json['title'], done: json['done']);
  Map<String, dynamic> toJson() => {'title': title, 'done': done};
}
