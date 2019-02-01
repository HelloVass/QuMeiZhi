import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeiZhiDetailPage extends StatefulWidget {
  final String title;

  final String url;

  MeiZhiDetailPage({@required this.title, @required this.url});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MeiZhiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Hero(
        tag: widget.url,
        child: CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: widget.url,
            placeholder: Image(
              image: AssetImage("images/img_placeholder.png"),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
