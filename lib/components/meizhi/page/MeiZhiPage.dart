import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/meizhi/vo/MeiZhiVO.dart';
import 'package:flutter_meizhi/components/meizhi/vo/DisplayMode.dart';
import 'package:flutter_meizhi/components/meizhi/components/ImageDelegate.dart';
import 'package:flutter_meizhi/components/common/loadMore/LoadMoreWidget.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/Result.dart';
import 'package:flutter_meizhi/api/dto/MeiZhiResponse.dart';

class MeiZhiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MeiZhiPage> {
  // 显示模式，线性或者网格
  var _mode = DisplayMode.Linear;

  // 加载中
  var loading = false;

  // 有更多
  var hasMore = true;

  // 出错
  var error;

  // 页数
  var _pageNum = 1;

  // 数据
  List<MeiZhiVO> items = List();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('妹纸'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.transform),
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
      body: LoadMoreWidget(
        crossAxisCount: _mode == DisplayMode.Linear ? 1 : 2,
        adapt: (BuildContext context, int index) => ImageDelegate(
              data: items[index],
            ),
        itemCount: items.length,
        hasMore: hasMore,
        loading: loading,
        error: error,
        loadMore: () {
          _loadData();
        },
      ),
    );
  }

  void _loadData() async {
    // 开始加载
    setState(() {
      loading = true;
      error = null;
    });

    await ApiClient.get("api/data/福利/20/$_pageNum").then((json) {
      setState(() {
        List<MeiZhiVO> newItems = Result.fromJson(
                json: json, mapper: (json) => MeiZhiResponse.fromJson(json))
            .results
            .map((v) => MeiZhiVO(v))
            .toList();
        items += newItems;
        loading = false;
        hasMore = newItems.length >= 10;
        error = null;
        _pageNum++;
      });
    }).catchError((e) {
      setState(() {
        loading = false;
        error = "加载出错";
      });
    });
  }
}
