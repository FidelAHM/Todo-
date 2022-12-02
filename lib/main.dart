import 'package:flutter/material.dart';
import 'package:todo_getx/screens/homeScreen.dart';
import 'package:todo_getx/screens/todo_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  runApp(const MyApp());
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Todo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false);
  }
}
