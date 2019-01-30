import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final bool selected;

  TabWidget({@required this.title, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: selected ? Colors.blue : Colors.grey),
    );
  }
}
