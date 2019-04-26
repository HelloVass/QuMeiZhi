import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/MeiZhiResponse.dart';
import 'package:flutter_meizhi/api/dto/Result.dart';
import 'package:flutter_meizhi/components/common/loadMore/GridLoadMoreWrapper.dart';
import 'package:flutter_meizhi/components/common/refresh/SwipeRefreshLayout.dart';
import 'package:flutter_meizhi/components/meizhi/components/ImageDelegate.dart';
import 'package:flutter_meizhi/components/meizhi/vo/DisplayMode.dart';
import 'package:flutter_meizhi/components/meizhi/vo/MeiZhiVO.dart';

class MeiZhiPage extends StatefulWidget {
  MeiZhiPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MeiZhiPage> with AutomaticKeepAliveClientMixin<MeiZhiPage> {
  // 显示模式，线性或者网格
  var _mode = DisplayMode.Linear;

  // 加载中
  var _loading = false;

  // 有更多
  var _hasMore = true;

  // 出错
  Error _error;

  // 页数
  var _pageNum = 1;

  // 数据
  List<MeiZhiVO> _items = List();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('妹纸'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: _mode == DisplayMode.Linear
                ? Icon(Icons.grid_off)
                : Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _mode = (_mode == DisplayMode.Linear)
                    ? DisplayMode.Grid
                    : DisplayMode.Linear;
              });
            },
          )
        ],
      ),
      body: SwipeRefreshLayout(
        onRefreshListener: _onRefresh,
        child: GridLoadMoreWrapper(
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          crossAxisCount: _mode == DisplayMode.Linear ? 1 : 2,
          buildItem: (context, index) => ImageDelegate(data: _items[index]),
          itemCount: _items.length,
          hasMore: _hasMore,
          loading: _loading,
          error: _error,
          childAspectRatio: 1 / 1,
          onLoadMore: () => _onLoadMore(),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _loading = true;
        _error = null;
        _pageNum = 1;
      });
    });

    await ApiClient.get("api/data/福利/20/$_pageNum").then((json) {
      setState(() {
        List<MeiZhiVO> newItems = Result.fromJson(
                json: json, mapper: (json) => MeiZhiResponse.fromJson(json))
            .results
            .map((v) => MeiZhiVO(v))
            .toList();
        _items = newItems;
        _loading = false;
        _hasMore = newItems.length >= 10;
        _error = null;
        _pageNum++;
      });
    }).catchError((e) {
      setState(() {
        _loading = false;
        _error = e;
      });
    });
  }

  void _onLoadMore() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    await ApiClient.get("api/data/福利/20/$_pageNum").then((json) {
      setState(() {
        List<MeiZhiVO> newItems = Result.fromJson(
                json: json, mapper: (json) => MeiZhiResponse.fromJson(json))
            .results
            .map((v) => MeiZhiVO(v))
            .toList();
        _items += newItems;
        _loading = false;
        _hasMore = newItems.length >= 10;
        _error = null;
        _pageNum++;
      });
    }).catchError((e) {
      setState(() {
        _loading = false;
        _error = e;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;
}
