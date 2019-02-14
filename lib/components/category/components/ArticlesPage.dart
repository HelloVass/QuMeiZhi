import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/MeiZhiResponse.dart';
import 'package:flutter_meizhi/api/dto/Result.dart';
import 'package:flutter_meizhi/components/category/components/ArticleDelegate.dart';
import 'package:flutter_meizhi/components/category/vo/ArticleVO.dart';
import 'package:flutter_meizhi/components/common/loadMore/LinearLoadMoreWrapper.dart';
import 'package:flutter_meizhi/components/common/refresh/SwipeRefreshLayout.dart';

class ArticlesPage extends StatefulWidget {
  final String title;

  ArticlesPage({Key key, @required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ArticlesPage>
    with AutomaticKeepAliveClientMixin<ArticlesPage> {
  // 加载中
  var _loading = false;

  // 有更多
  var _hasMore = true;

  // 出错
  Error _error;

  // 页数
  var _pageNum = 1;

  // 数据
  List<ArticleVO> _items = [];

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeRefreshLayout(
        onRefreshListener: _onRefresh,
        child: LinearLoadMoreWrapper(
          itemCount: _items.length,
          hasMore: _hasMore,
          loading: _loading,
          error: _error,
          buildItem: (context, index) => ArticleDelegate(data: _items[index]),
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
    await ApiClient.get('api/data/${widget.title}/10/$_pageNum').then((json) {
      setState(() {
        List<ArticleVO> newItems = Result.fromJson(
                json: json, mapper: (json) => MeiZhiResponse.fromJson(json))
            .results
            .map((v) => ArticleVO(v))
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

    await ApiClient.get("api/data/${widget.title}/10/$_pageNum").then((json) {
      setState(() {
        List<ArticleVO> newItems = Result.fromJson(
                json: json, mapper: (json) => MeiZhiResponse.fromJson(json))
            .results
            .map((v) => ArticleVO(v))
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
