import 'package:flutter/material.dart';

import 'LoadingWidget.dart';

class StatusLayout extends StatefulWidget {
  final Widget child;
  final bool loading;

  StatusLayout({@required this.child, @required this.loading});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<StatusLayout> {
  @override
  Widget build(BuildContext context) {
    return widget.loading ? LoadingWidget() : widget.child;
  }
}
