import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiteBrowser extends StatefulWidget {
  final String title;
  final String url;

  LiteBrowser({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LiteBrowser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _share(widget.url),
          )
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _share(String url) {
    Share.share(url);
  }
}
