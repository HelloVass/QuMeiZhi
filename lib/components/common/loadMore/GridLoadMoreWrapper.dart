import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/common/loadMore/DefaultLoadingWidget.dart';

typedef BuildItem = Function(BuildContext context, int index);

typedef OnLoadMore = Function();

class GridLoadMoreWrapper extends StatefulWidget {
  final int crossAxisCount;

  final double mainAxisSpacing;

  final double crossAxisSpacing;

  final int itemCount;

  final BuildItem buildItem;

  final bool hasMore;

  final bool loading;

  final Error error;

  final double childAspectRatio;

  final OnLoadMore onLoadMore;

  GridLoadMoreWrapper(
      {Key key,
      @required this.mainAxisSpacing,
      @required this.crossAxisSpacing,
      @required this.crossAxisCount,
      @required this.itemCount,
      @required this.buildItem,
      @required this.hasMore,
      @required this.loading,
      @required this.error,
      @required this.childAspectRatio,
      @required this.onLoadMore})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<GridLoadMoreWrapper> {
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
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) => index >= widget.itemCount
          ? DefaultLoadingWidget(
              hasMore: widget.hasMore,
              loading: widget.loading,
              error: widget.error)
          : widget.buildItem(context, index),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.childAspectRatio,
      ),
      controller: _scrollController,
    );
  }

  bool _onBottom() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }
}
