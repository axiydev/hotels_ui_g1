/*
Created by Axmadjon Isaqov on 14:17:44 27.07.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Hotels UI
*/

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/pages/home/home_page.dart';
import 'package:qr_scanner_app/pages/lesson/task_page.dart';
import 'package:qr_scanner_app/pages/task/lesson_page.dart';
import 'package:qr_scanner_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.homeRoute: (context) => const MyHomePage(title: 'hello'),
        Routes.taskRoute: (context) => const TaskPage(),
        Routes.lessonRouteName: (context) => const LessonPage()
      },
      initialRoute: Routes.lessonRouteName,
    );
  }
}
