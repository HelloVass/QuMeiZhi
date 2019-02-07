import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/DailyResponse.dart';
import 'package:flutter_meizhi/components/latest/vo/ItemVO.dart';
import 'package:flutter_meizhi/components/latest/components/DailyWdiget.dart';
import 'package:flutter_meizhi/components/latest/components/SectionWidget.dart';

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
            onPressed: () => {},
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildItems(context, _items[index]);
        },
        itemCount: _items.length,
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

    if (dailyResponse.result.android != null) {
      result.add(SectionVO(title: 'Android'));
      result +=
          dailyResponse.result.android.map((v) => DailyVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.app != null) {
      result.add(SectionVO(title: 'App'));
      result +=
          dailyResponse.result.app.map((v) => DailyVO(wrapper: v)).toList();
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

    if (dailyResponse.result.web != null) {
      result.add(SectionVO(title: '前端'));
      result +=
          dailyResponse.result.web.map((v) => DailyVO(wrapper: v)).toList();
    }

    if (dailyResponse.result.resource != null) {
      result.add(SectionVO(title: '拓展资源'));
      result += dailyResponse.result.resource
          .map((v) => DailyVO(wrapper: v))
          .toList();
    }

    if (dailyResponse.result.recommands != null) {
      result.add(SectionVO(title: '瞎推荐'));
      result += dailyResponse.result.recommands
          .map((v) => DailyVO(wrapper: v))
          .toList();
    }

    if (dailyResponse.result.fuli != null) {
      result.add(SectionVO(title: '福利'));
      result +=
          dailyResponse.result.fuli.map((v) => DailyVO(wrapper: v)).toList();
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

    throw new Exception('未知的 item ==>>>$item');
  }
}
