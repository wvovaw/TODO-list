import 'package:flutter/material.dart';
import 'package:todo_list/todolist/modal/todo.dart';
import 'package:todo_list/todolist/todo_list_item.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

class TodoListState extends State<TodoList> {
  final ScrollController _scrollController = new ScrollController();
  List<TodoModal> _todoModal = [];
  TextEditingController _titleController1 = TextEditingController();
  TextEditingController _titleController2 = TextEditingController();
  
  Future<List<dynamic>>_createAlertDialog (BuildContext context) { 
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('New todo'),
        content: Column(
            children: <Widget>[
              TextField(
                controller: _titleController1,
              ),
              TextField(
                controller: _titleController2,
              ),
            ],
          ),
          
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
              _titleController1.clear();
              _titleController2.clear();
            },
          ),
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed: () {
              List<dynamic> ret = [
                _titleController1.text,
                _titleController2.text
              ];
              Navigator.of(context).pop<List<dynamic>>(ret);
              _titleController1.clear();
              _titleController2.clear();
            },
          ),
        ],
      );
    } );
  }
  _onTodoListUpdate() {
    String newTitle;
    String newText;
    setState(() {
      _createAlertDialog(context).then((onValue) {
        newTitle = onValue[0].toString();
        newText = onValue[1].toString();
        print('newTitle: ' + newTitle);
        print('newText: ' + newText);
        setState(() {
          _todoModal.add(
            TodoModal(
              title: newTitle,
              text: newText,
            )
          );
        _scrollController.animateTo(
           0.0,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
        );
    });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("TODO: List"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(    
                controller: _scrollController,      
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 0.0),
                children: _buildTodoList(),
              ),
              //color: utils.getCustomTheme().secondaryHeaderColor,                        
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: utils.getCustomTheme().accentColor,
          onPressed: () {
            _onTodoListUpdate();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: utils.getCustomTheme().primaryColor,
          child: Container(height: 40.0,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  List<TodoListItem> _buildTodoList() {
    return _todoModal
        .map((todo) => TodoListItem(todo))
        .toList();
  }
}
class TodoList extends StatefulWidget {
  TodoListState createState() => TodoListState();
}