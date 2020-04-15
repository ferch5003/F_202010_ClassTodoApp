import 'package:flutter/material.dart';

class CardTodo extends StatelessWidget {
  final String title;
  final String body;
  final int completed;
  final Icon icon;
  final VoidCallback onTap;

  CardTodo(
      {Key key, this.title, this.body, this.completed, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: completed == 1 ? Colors.blueGrey : Colors.yellow[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 140,
            child: ListTile(
              leading: icon,
              contentPadding: const EdgeInsets.only(top: 20.0, left: 10.0),
              title: Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              subtitle: Text("$body", style: TextStyle(fontSize: 17.0)),
              isThreeLine: true,
              onTap: () => onTap(),
            ),
          ),
        ],
      ),
    );
  }
}
