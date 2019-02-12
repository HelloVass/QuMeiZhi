import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/category/components/ArticlesPage.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CategoryPage> with SingleTickerProviderStateMixin {
  static const _tabs = ['Android', 'iOS', '前端', '休息视频', '拓展资源', '瞎推荐', 'App'];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        centerTitle: true,
        bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: _tabs
                .map((String title) => Tab(
                      text: title,
                    ))
                .toList()),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabs
              .map((String title) => ArticlesPage(
                    title: title,
                  ))
              .toList()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
