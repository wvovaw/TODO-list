import 'package:flutter/material.dart';
import 'package:todo_list/todolist/modal/todo.dart';
import 'package:todo_list/todolist/todo_list_item.dart';
import 'package:todo_list/todolist/utils.dart' as utils;

class TodoListState extends State<TodoList> {
  final ScrollController _scrollController = new ScrollController();
  List<TodoModal> _todoModal = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  
  Future<List<dynamic>>_createAlertDialog (BuildContext context) { 
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            height: 220,
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Title"
                  ),
                ),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Text"
                  ),
                ),
                MaterialButton(
                  child: Container(
                    child: Text("Submit"),
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.only(
                      top: 35.0
                    ),
                    decoration: BoxDecoration(
                      color: utils.getCustomTheme().accentColor,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  onPressed: () {
                    List<dynamic> ret = [
                      _titleController.text,
                      _textController.text
                    ];
                    Navigator.of(context).pop<List<dynamic>>(ret);
                      _titleController.clear();
                      _textController.clear();
                  }
                )
              ],
            ),
          ),
        );
      }
    );
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