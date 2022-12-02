import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo_getx/screens/todohome.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        backgroundColor: Colors.white,
        image: Image.asset(
          'lib/images/to-do.png',
          width: 200,
          height: 200,
        ),
        photoSize: 100,
        seconds: 5,
        loaderColor: Colors.pink,
        navigateAfterSeconds: TodoHome());
  }
}
