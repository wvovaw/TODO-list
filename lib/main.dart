import 'package:flutter/material.dart';
import 'package:todo_list/todolist/todolist.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: utils.getCustomTheme(),
      home: MainPage(),
    ));
  }
}
class MainPage extends StatefulWidget {
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override 
  Widget build(BuildContext context) {
    return TodoList();
  }
}

