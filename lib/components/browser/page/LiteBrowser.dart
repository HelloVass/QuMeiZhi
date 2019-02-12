import 'package:flutter/material.dart';
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
