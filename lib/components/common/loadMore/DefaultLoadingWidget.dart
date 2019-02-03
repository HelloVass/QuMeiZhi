import 'package:flutter/material.dart';

class DefaultLoadingWidget extends StatelessWidget {
  final bool hasMore;

  final bool loading;

  final String error;

  DefaultLoadingWidget(
      {@required this.hasMore, @required this.loading, @required this.error});

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text('加载出错')],
        ),
      ));
    }
    if (loading) {
      return Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 3.0,
            )
          ],
        ),
      ));
    }
    if (!hasMore) {
      return Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text('没有更多数据啦')],
        ),
      ));
    }
    return Container();
  }
}
