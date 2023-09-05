import 'package:first_app_ui/view/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
