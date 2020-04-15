import 'package:flutter/material.dart';

class TodoTypeDropdown extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;
  
  TodoTypeDropdown({Key key, this.selected, this.onChangedValue}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChangedValue,
      items: <String>['DEFAULT', 'CALL', 'HOME_WORK']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
