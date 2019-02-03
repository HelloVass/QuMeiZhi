import 'package:flutter/material.dart';

typedef OnRefreshListener = Future<void> Function();

class SwipeRefreshLayout extends StatefulWidget {
  final Widget child;
  final OnRefreshListener onRefreshListener;

  SwipeRefreshLayout({this.child, this.onRefreshListener});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SwipeRefreshLayout> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefreshListener,
      child: widget.child,
    );
  }
}
