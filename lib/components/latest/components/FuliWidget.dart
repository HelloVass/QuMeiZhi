import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/latest/vo/ItemVO.dart';
import 'package:flutter_meizhi/components/meizhiDetail/page/MeiZhiDetailPage.dart';

class FuliWidget extends StatelessWidget {
  final FuLiVO data;

  FuliWidget({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: data.wrapper.url,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: GestureDetector(
          onTap: () => _redirectToMeiZhiDetail(context, data),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: data.wrapper.url,
            placeholder: Image(
              image: AssetImage('images/img_placeholder'),
              fit: BoxFit.cover,
              height: 190.0,
            ),
            height: 190.0,
          ),
        ),
      ),
    );
  }

  void _redirectToMeiZhiDetail(BuildContext context, FuLiVO data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MeiZhiDetailPage(
              title: data.wrapper.desc,
              url: data.wrapper.url,
            )));
  }
}
