import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/common/loadMore/DefaultLoadingWidget.dart';

typedef BuildItem = Function(BuildContext context, int index);

typedef OnLoadMore = Function();

class LinearLoadMoreWrapper extends StatefulWidget {
  final int itemCount;

  final bool hasMore;

  final bool loading;

  final Error error;

  final BuildItem buildItem;

  final OnLoadMore onLoadMore;

  LinearLoadMoreWrapper(
      {Key key,
      @required this.itemCount,
      @required this.hasMore,
      @required this.loading,
      @required this.error,
      @required this.buildItem,
      @required this.onLoadMore})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LinearLoadMoreWrapper> {
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
        widget.onLoadMore();
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
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) => index >= widget.itemCount
          ? DefaultLoadingWidget(
              hasMore: widget.hasMore,
              loading: widget.loading,
              error: widget.error)
          : widget.buildItem(context, index),
      controller: _scrollController,
    );
  }

  bool _onBottom() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }
}
