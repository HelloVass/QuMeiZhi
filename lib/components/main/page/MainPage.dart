import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/category/page/CategoryPage.dart';
import 'package:flutter_meizhi/components/latest/page/LatestPage.dart';
import 'package:flutter_meizhi/components/main/components/TabWidget.dart';
import 'package:flutter_meizhi/components/main/vo/TabVO.dart';
import 'package:flutter_meizhi/components/meizhi/page/MeiZhiPage.dart';
import 'package:flutter_meizhi/components/mine/page/MinePage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MainPage> {
  static const _tabs = [
    TabVO('最新', Icon(Icons.home), 0),
    TabVO('分类', Icon(Icons.widgets), 1),
    TabVO('妹纸', Icon(Icons.spa), 2),
    TabVO('我的', Icon(Icons.person), 3)
  ];

  static final _pages = [
    LatestPage(),
    CategoryPage(),
    MeiZhiPage(),
    MinePage()
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: tab.icon,
                  title: TabWidget(
                    title: tab.title,
                    selected: (tab.index == _index),
                  ),
                ))
            .toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
