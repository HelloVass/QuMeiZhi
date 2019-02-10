import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/HistoryResponse.dart';
import 'package:flutter_meizhi/api/dto/Result.dart';
import 'package:flutter_meizhi/components/common/loadMore/LoadMoreWidget.dart';
import 'package:flutter_meizhi/components/common/refresh/SwipeRefreshLayout.dart';
import 'package:flutter_meizhi/components/common/status/StatusLayout.dart';
import 'package:flutter_meizhi/components/history/components/HistoryDelegate.dart';
import 'package:flutter_meizhi/components/history/vo/HistoryVO.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<HistoryPage> {
  // 加载中
  var _loading = false;

  // 有更多
  var _hasMore = true;

  // 出错
  var _error;

  // 页数
  var _pageNum = 1;

  // 数据
  List<HistoryVO> _items = List();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('干货历史'),
        centerTitle: true,
      ),
      body: StatusLayout(
        loading: _items.isEmpty,
        child: SwipeRefreshLayout(
          onRefreshListener: _onRefresh,
          child: LoadMoreWidget(
            crossAxisCount: 1,
            itemCount: _items.length,
            adapt: (context, index) => HistoryDelegate(data: _items[index]),
            hasMore: _hasMore,
            loading: _loading,
            error: _error,
            onLoadMoreListener: () => _onLoadMore(),
            childAspectRatio: 16 / 9,
          ),
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
    await ApiClient.get('api/history/content/10/$_pageNum').then((json) {
      setState(() {
        List<HistoryVO> newItems = Result.fromJson(
                json: json, mapper: (json) => HistoryResponse.fromJson(json))
            .results
            .map((v) => HistoryVO(wrapper: v))
            .toList();
        _items = newItems;
        _loading = false;
        _hasMore = newItems.length >= 10;
        _error = null;
        _pageNum++;
      });
    });
  }

  void _onLoadMore() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    await ApiClient.get('api/history/content/10/$_pageNum').then((json) {
      setState(() {
        List<HistoryVO> newItems = Result.fromJson(
                json: json, mapper: (json) => HistoryResponse.fromJson(json))
            .results
            .map((v) => HistoryVO(wrapper: v))
            .toList();
        _items += newItems;
        _loading = false;
        _hasMore = newItems.length >= 10;
        _error = null;
        _pageNum++;
      });
    });
  }
}
