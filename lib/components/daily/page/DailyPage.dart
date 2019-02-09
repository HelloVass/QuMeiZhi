import 'package:flutter/material.dart';
import 'package:flutter_meizhi/api/ApiClient.dart';
import 'package:flutter_meizhi/api/dto/DailyResponse.dart';
import 'package:flutter_meizhi/components/daily/components/DailyWdiget.dart';
import 'package:flutter_meizhi/components/daily/components/FuLiWidget.dart';
import 'package:flutter_meizhi/components/daily/components/SectionWidget.dart';
import 'package:flutter_meizhi/components/daily/vo/ItemVO.dart';

class DailyPage extends StatefulWidget {
  final String title;
  final String date;

  DailyPage({Key key, @required this.title, @required this.date})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<DailyPage> {
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) => _buildItem(context, _items[index])),
    );
  }

  void _loadData() async {
    await ApiClient.get('api/day/${widget.date}').then((json) {
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
      result.add(SectionVO(title: '拓展资源'));
      result += dailyResponse.result.resource
          .map((v) => DailyVO(wrapper: v))
          .toList();
    }

    return result;
  }

  Widget _buildItem(BuildContext context, ItemVO item) {
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
}
