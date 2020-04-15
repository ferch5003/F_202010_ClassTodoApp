import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String _dropSelected = "DEFAULT";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New Todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: controllerTitle,
              ),
              TextField(
                  decoration: InputDecoration(labelText: "Body"),
                  controller: controllerBody),
              Center(
                  child: TodoTypeDropdown(
                selected: _dropSelected,
                onChangedValue: (value) => setState(() {
                  _dropSelected = value;
                }),
              ))
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Cancel',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: () {
              controllerTitle.clear();
              controllerBody.clear();

              Navigator.of(context).pop();
            }),
        FlatButton(
            child: Text('Add',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            onPressed: () {
              final todo = Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                  icon: getIcon(_dropSelected));
              controllerTitle.clear();
              controllerBody.clear();

              Navigator.of(context).pop(todo);
            }),
      ],
    );
  }

  Icon getIcon(String selected) {
    switch (selected) {
      case 'DEFAULT':
        return Icon(Icons.check, size: 72.0);
      case 'CALL':
        return Icon(Icons.call, size: 72.0);
      case 'HOME_WORK':
        return Icon(Icons.contacts, size: 72.0);
      default:
        return Icon(Icons.dialpad, size: 72.0);
    }
  }
}
