import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/todolist/modal/todo.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

class TodoListItem extends StatelessWidget {
  final TodoModal _todoModal;

  TodoListItem(this._todoModal);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            color: utils.getCustomTheme().accentColor,
            offset: Offset(4, 4),
          ),
        ]
      ),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.done), //Тут было последнее изменение
            title: Text(
              _todoModal.title,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              _todoModal.text,
              style: TextStyle(
              fontSize: 17.0,
              ),
            ),
          ),
        ],),
      );
  }
}