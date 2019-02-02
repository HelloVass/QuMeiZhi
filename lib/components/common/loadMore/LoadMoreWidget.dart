import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/common/loadMore/DefaultLoadingWidget.dart';

typedef Adapt = Function(BuildContext context, int index);

typedef OnLoadMoreListener = Function();

class LoadMoreWidget extends StatefulWidget {
  final int crossAxisCount;

  final int itemCount;

  final Adapt adapt;

  final bool hasMore;

  final bool loading;

  final String error;

  final OnLoadMoreListener onLoadMoreListener;

  LoadMoreWidget(
      {Key key,
      @required this.crossAxisCount,
      @required this.itemCount,
      @required this.adapt,
      @required this.hasMore,
      @required this.loading,
      @required this.error,
      @required this.onLoadMoreListener})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LoadMoreWidget> {
  // 控制器
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_onBottom()) {
        if (widget.error != null) {
          // 发生错误
          return;
        }
        if (widget.loading) {
          // 加载中
          return;
        }
        if (!widget.hasMore) {
          // 没有更多数据
          return;
        }
        widget.onLoadMoreListener();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: widget.itemCount + 1,
      itemBuilder: (BuildContext context, int index) =>
          index >= widget.itemCount
              ? DefaultLoadingWidget(
                  hasMore: widget.hasMore,
                  loading: widget.loading,
                  error: widget.error)
              : widget.adapt(context, index),
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0),
    );
  }

  bool _onBottom() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }
}
