/*
Created by Axmadjon Isaqov on 14:17:44 27.07.2022
© 2022 @axi_dev 
*/

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/pages/home/home_page.dart';
import 'package:qr_scanner_app/pages/lesson/task_page.dart';
import 'package:qr_scanner_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.homeRoute: (context) => const MyHomePage(title: 'hello'),
        Routes.taskRoute: (context) => const TaskPage()
      },
      initialRoute: Routes.taskRoute,
    );
  }
}
