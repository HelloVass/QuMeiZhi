import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/common/photoView/PhotoView.dart';

class MeiZhiDetailPage extends StatefulWidget {
  final String title;

  final String url;

  MeiZhiDetailPage({Key key, @required this.title, @required this.url})
      : super(key: key);

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
      body: PhotoView(
        url: widget.url,
      ),
    );
  }
}
