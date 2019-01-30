import 'package:flutter/material.dart';

class LatestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LatestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.reorder),
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}
