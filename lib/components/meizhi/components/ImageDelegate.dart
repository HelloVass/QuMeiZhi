import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/meizhi/vo/MeiZhiVO.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDelegate extends StatelessWidget {
  final MeiZhiVO data;

  ImageDelegate({@required this.data});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new GestureDetector(
          onTap: () {},
          child: new CachedNetworkImage(
            fit: BoxFit.cover,
            placeholder: Image(
              image: AssetImage("images/img_placeholder.png"),
              fit: BoxFit.cover,
            ),
            imageUrl: data.wrapper.url,
          )),
    );
  }
}
