import 'package:flutter/material.dart';
import 'package:todo_list/todolist/todolist.dart';
import 'package:todo_list/todolist/modal/todo.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: utils.getCustomTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("TODO: List"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: utils.getCustomTheme().accentColor,
          onPressed: () {},
        ),
        bottomNavigationBar: BottomAppBar(
          color: utils.getCustomTheme().primaryColor,
          child: Container(height: 40.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: TodoListPage(),
      ),
    ));
  }
}
// TODO: Поменять _buildTodoList() на кнопку добавления итема
class TodoListPage extends StatelessWidget {
  _buildTodoList() {
    return <TodoModal>[
      const TodoModal(
        title: 'Первый',
        text: 'Hamudahabib hamud hamuda habibiHamudahabib hamud hamuda habibi'),
      const TodoModal(
        title: 'second',
        text: 'Anele anele allahu akbar!!!!!'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TodoList(_buildTodoList()),);
  }
}
