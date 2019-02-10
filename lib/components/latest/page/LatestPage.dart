import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/DailyResponse.dart';
import 'package:flutter_meizhi/components/common/status/StatusLayout.dart';
import 'package:flutter_meizhi/components/history/page/HistoryPage.dart';
import 'package:flutter_meizhi/components/latest/components/DailyWdiget.dart';
import 'package:flutter_meizhi/components/latest/components/FuliWidget.dart';
import 'package:flutter_meizhi/components/latest/components/SectionWidget.dart';
import 'package:flutter_meizhi/components/latest/vo/ItemVO.dart';

class LatestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LatestPage> {
  List<ItemVO> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.reorder),
            onPressed: () => _redirectToHistory(context),
          )
        ],
      ),
      body: StatusLayout(
        loading: _items.isEmpty,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _buildItems(context, _items[index]);
          },
          itemCount: _items.length,
        ),
      ),
    );
  }

  void _loadData() async {
    await ApiClient.get('api/today').then((json) {
      setState(() {
        _items = _mapper(DailyResponse.fromJson(json));
      });
    });
  }

  List<ItemVO> _mapper(DailyResponse dailyResponse) {
    List<ItemVO> result = [];

    if (dailyResponse.result.fuli != null) {
      result +=
          dailyResponse.result.fuli.map((v) => FuLiVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.android != null) {
      result.add(SectionVO(title: 'Android'));
      result +=
          dailyResponse.result.android.map((v) => DailyVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.iOS != null) {
      result.add(SectionVO(title: 'iOS'));
      result +=
          dailyResponse.result.iOS.map((v) => DailyVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.video != null) {
      result.add(SectionVO(title: '休息视频'));
      result +=
          dailyResponse.result.video.map((v) => DailyVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.resource != null) {
      result += dailyResponse.result.resource
          .map((v) => DailyVO(wrapper: v))
          .toList();
    }

    return result;
  }

  Widget _buildItems(BuildContext context, ItemVO item) {
    if (item is SectionVO) {
      return SectionWidget(
        title: item.title,
      );
    }

    if (item is DailyVO) {
      return DailyWidget(
        dailyVO: item,
      );
    }

    if (item is FuLiVO) {
      return FuliWidget(
        data: item,
      );
    }

    throw new Exception('unknown item ==>>>$item');
  }

  void _redirectToHistory(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HistoryPage()));
  }
}
