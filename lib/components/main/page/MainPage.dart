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

  final _pages = [LatestPage(), CategoryPage(), MeiZhiPage()];

  PageController _pageController;

  int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
    _pageController = PageController(initialPage: _index, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _index = index;
          });
        },
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs
            .map((tab) =>
            BottomNavigationBarItem(
              icon: tab.icon,
              title: TabWidget(
                title: tab.title,
                selected: (tab.index == _index),
              ),
            ))
            .toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (int index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
