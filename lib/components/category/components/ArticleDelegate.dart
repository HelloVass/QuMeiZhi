import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meizhi/components/browser/page/LiteBrowser.dart';
import 'package:flutter_meizhi/components/category/vo/ArticleVO.dart';

class ArticleDelegate extends StatelessWidget {
  final ArticleVO data;

  ArticleDelegate({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LiteBrowser(
                      title: data.wrapper.url,
                      url: data.wrapper.url,
                    )));
          },
          child: CardWidget(
              title: data.wrapper.desc,
              date: data.wrapper.createdAt.substring(0, 10),
              author: data.wrapper.who,
              imgs: data.wrapper.images)),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String date;
  final String author;
  final List<String> imgs;

  CardWidget({Key key, this.title, this.date, this.author, this.imgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  title,
                  maxLines: 4,
                  style: TextStyle(fontSize: 16.0),
                )),
                imgs == null || imgs.isEmpty
                    ? Text('')
                    : Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: CachedNetworkImage(
                            imageUrl: imgs[0],
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                            placeholder: Image(
                              image: AssetImage('images/img_placeholder.png'),
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,
                            )),
                      ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    author,
                    style: TextStyle(color: Color(0xFF888888), fontSize: 12.0),
                  )),
                  Text(
                    date,
                    style: TextStyle(color: Color(0xFF888888), fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
