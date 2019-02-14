import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/browser/page/LiteBrowser.dart';
import 'package:flutter_meizhi/components/daily/vo/ItemVO.dart';

class DailyWidget extends StatelessWidget {
  final DailyVO dailyVO;

  DailyWidget({Key key, this.dailyVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          _redirectToDetail(context, dailyVO);
        },
        child: Card(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        dailyVO.wrapper.desc,
                        maxLines: 4,
                        style: TextStyle(fontSize: 16.0),
                      )),
                      dailyVO.wrapper.images == null ||
                              dailyVO.wrapper.images.isEmpty
                          ? Text('')
                          : Container(
                              margin: EdgeInsets.only(left: 8.0),
                              child: CachedNetworkImage(
                                imageUrl: dailyVO.wrapper.images[0],
                                fit: BoxFit.fitWidth,
                                width: 90,
                                height: 90,
                                placeholder: Image(
                                  image:
                                      AssetImage('images/img_placeholder.png'),
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          dailyVO.wrapper.who,
                          style: TextStyle(
                              color: Color(0xFF888888), fontSize: 12.0),
                        )),
                        Text(
                          dailyVO.wrapper.createdAt.substring(0, 10),
                          style: TextStyle(
                              color: Color(0xFF888888), fontSize: 12.0),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          elevation: 3.0,
          margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        ),
      ),
    );
  }

  _redirectToDetail(BuildContext context, DailyVO dailyVO) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LiteBrowser(
              title: dailyVO.wrapper.desc,
              url: dailyVO.wrapper.url,
            )));
  }
}
