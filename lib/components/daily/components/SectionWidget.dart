import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ],
      ),
    );
  }

  SectionWidget({this.title});
}
