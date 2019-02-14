import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/daily/vo/ItemVO.dart';
import 'package:flutter_meizhi/components/meizhiDetail/page/MeiZhiDetailPage.dart';

class FuliWidget extends StatelessWidget {
  final FuLiVO data;

  FuliWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () => _redirectToMeiZhiDetail(context, data),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: data.wrapper.url,
          placeholder: Image(
            image: AssetImage('images/img_placeholder.png'),
            fit: BoxFit.cover,
            height: 190.0,
          ),
          height: 190.0,
        ),
      ),
    );
  }

  void _redirectToMeiZhiDetail(BuildContext context, FuLiVO data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MeiZhiDetailPage(
              title: data.wrapper.desc,
              url: data.wrapper.url,
            )));
  }
}
