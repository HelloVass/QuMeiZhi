import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final bool selected;

  TabWidget({Key key, @required this.title, @required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: selected ? Colors.blue : Colors.grey),
    );
  }
}
