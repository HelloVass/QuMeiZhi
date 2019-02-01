import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/meizhi/vo/MeiZhiVO.dart';
import 'package:flutter_meizhi/components/meizhiDetail/page/MeiZhiDetailPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDelegate extends StatelessWidget {
  final MeiZhiVO data;

  ImageDelegate({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: data.wrapper.url,
      child: Container(
        child: GestureDetector(
            onTap: () {
              _redirectToDetail(context, data);
            },
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: Image(
                image: AssetImage("images/img_placeholder.png"),
                fit: BoxFit.cover,
              ),
              imageUrl: data.wrapper.url,
            )),
      ),
    );
  }

  void _redirectToDetail(BuildContext context, MeiZhiVO data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MeiZhiDetailPage(
              title: data.wrapper.desc,
              url: data.wrapper.url,
            )));
  }
}
