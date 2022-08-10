import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/webview.dart';

class NewsItem extends StatelessWidget {
  final NewsModel _news;
  NewsItem(this._news);

  _openNewsUrl(final String url, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Webview(url)));
  }

  @override
  Widget build(BuildContext context) {
    var _url = _news.imageUrl;
    return Card(
        margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        elevation: 2,
        child: GestureDetector(
          onTap: () =>
              _openNewsUrl(_news.sourceUrl, context), //inform(_url, context),
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.network(
                    _url,
                    // loadingBuilder: (context, child, loadingProgress) {
                    //   return CircularProgressIndicator(
                    //     color: Colors.black,
                    //   );
                    // },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/image_not_found.png');
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      _news.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Author: ${_news.sourceName}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Text(
                      _news.publishedTime.isNotEmpty
                          ? 'Published: ${_news.publishedTime.substring(0, 10)}'
                          : '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ),
                ],
              )),
        ));
  }
}
