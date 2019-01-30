import 'package:flutter/material.dart';

class MeiZhiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MeiZhiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('妹纸'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.transform),
            onPressed: () =>
            {

            },
          )
        ],
      ),
    );
  }
}