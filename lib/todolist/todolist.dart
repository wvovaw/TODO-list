import 'package:flutter/material.dart';
import 'package:todo_list/todolist/modal/todo.dart';
import 'package:todo_list/todolist/todo_list_item.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

class TodoList extends StatelessWidget {
  final List<TodoModal> _todoModal;

  TodoList(this._todoModal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 7.0),
        children: _buildTodoList(),
      ),
      color: utils.getCustomTheme().secondaryHeaderColor,
    );
  }

  List<TodoListItem> _buildTodoList() {
    return _todoModal
        .map((todo) => TodoListItem(todo))
        .toList();
  }
}