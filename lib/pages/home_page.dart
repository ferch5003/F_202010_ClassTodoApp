import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/widgets/dialog.dart';
import 'package:f_202010_todo_class/widgets/card.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => _addTodo(),
          tooltip: 'Add task',
          child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          todos.removeAt(posicion);
        });
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  "Deleting",
                  style: TextStyle(color: Colors.white),
                ))),
      ),
      child: CardTodo(
        title: element.title,
        body: element.body,
        completed: element.completed,
        icon: element.icon,
        onTap: () => onTap(context, element, posicion),
      ),
    );
  }

  void onTap(BuildContext context, Todo location, int posicion) {
    setState(() {
      if (todos[posicion].completed == 0) {
        todos[posicion].completed = 1;
      }
    });
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context, builder: (context) => NewTodoDialog());

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }
}
