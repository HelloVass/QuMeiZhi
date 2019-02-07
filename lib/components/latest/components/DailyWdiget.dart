import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/latest/vo/ItemVO.dart';

class DailyWidget extends StatelessWidget {
  final DailyVO dailyVO;

  DailyWidget({this.dailyVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: _redirectToDetail(dailyVO),
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[Text(dailyVO.wrapper.desc)],
              )),
          elevation: 3.0,
          margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        ),
      ),
    );
  }

  _redirectToDetail(DailyVO dailyVO) {}
}
