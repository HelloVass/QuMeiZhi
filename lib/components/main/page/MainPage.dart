import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/category/page/CategoryPage.dart';
import 'package:flutter_meizhi/components/latest/page/LatestPage.dart';
import 'package:flutter_meizhi/components/main/components/TabWidget.dart';
import 'package:flutter_meizhi/components/main/vo/TabVO.dart';
import 'package:flutter_meizhi/components/meizhi/page/MeiZhiPage.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

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
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[LatestPage(), CategoryPage(), MeiZhiPage()],
        index: _index,
      ),
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
        onTap: (index) => _tabSelected(index),
      ),
    );
  }

  void _tabSelected(int index) {
    setState(() {
      _index = index;
    });
  }
}
