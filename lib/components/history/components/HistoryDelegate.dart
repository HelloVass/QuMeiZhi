import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/daily/page/DailyPage.dart';
import 'package:flutter_meizhi/components/history/vo/HistoryVO.dart';

class HistoryDelegate extends StatelessWidget {
  final HistoryVO data;
  final RegExp _regExp = RegExp(r'src=\"(.+?)\"');

  HistoryDelegate({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () =>
            _redirectTo(context, data.wrapper.publishedAt.substring(0, 10)),
        child: Hero(
          tag: _regExp.firstMatch(data.wrapper.content).group(1),
          child: Container(
            color: Color(0xFFDFDFDF),
            child: Stack(
              children: <Widget>[
                Container(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: _regExp.firstMatch(data.wrapper.content).group(1),
                    placeholder: Image(
                      image: AssetImage('images/img_placeholder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: window.physicalSize.width - 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0, top: 64, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.wrapper.publishedAt.substring(0, 10),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Text(
                        data.wrapper.title,
                        maxLines: 3,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.all(4.0),
          ),
        ),
      ),
    );
  }

  _redirectTo(BuildContext context, String publishedAt) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DailyPage(
              title: publishedAt,
              date: publishedAt.replaceAll('-', '/'),
            )));
  }
}
