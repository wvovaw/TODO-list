import 'package:flutter/material.dart';
import 'package:todo_list/todolist/modal/todo.dart';
//import 'package:todo_list/todolist/utils.dart' as utils;

class TodoListItem extends StatelessWidget {
  final TodoModal _todoModal;

  TodoListItem(this._todoModal);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        //leading: CircleAvatar(child: Text(_todoModal.fullName[0])),
        title: Text(
          _todoModal.title,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        subtitle: Text(
          _todoModal.text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        )
      ),
    );
  }
}