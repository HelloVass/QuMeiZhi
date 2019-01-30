import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/meizhi/vo/DisplayMode.dart';
import 'package:flutter_meizhi/components/meizhi/mock/MockApi.dart';
import 'package:flutter_meizhi/components/common/delegateManager/DelegateManager.dart';

class MeiZhiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MeiZhiPage> {
  // 显示模式，线性或者网格
  var _mode = DisplayMode.Linear;

  // 页数
  var _pageNum = 0;

  // 加载中
  var isLoading = false;

  // 有更多
  var hasMore = true;

  // 出错
  var error;

  List<int> items = List.generate(10, (i) => i);

  ScrollController _scrollController = ScrollController();

  MockApi _mockApi = MockApi();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 滑动到底部
        if (error != null) {
          // 发生错误
          return;
        }
        if (isLoading) {
          // 还在加载中
          return;
        }
        if (!hasMore) {
          // 没有更多数据了
          return;
        }
        _loadMore();
      }
    });
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
      body: DelegateManager(),
    );
  }

  void _loadMore() async {
    List<int> newItems = await _mockApi.mock(items.length, items.length + 10);
    setState(() {
      items.addAll(newItems);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
