import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Text('正在加载...'),
          ),
        ],
      ),
    );
  }
}
