import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
// import 'package:news_app/widgets/webview.dart';

class NewsItem extends StatelessWidget {
  final NewsModel _news;
  NewsItem(this._news);

  // inform(String webUrl, BuildContext context) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Webview(webUrl)));
  // }

  @override
  Widget build(BuildContext context) {
    var _url = _news.imageUrl;
    return Card(
        margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        elevation: 2,
        child: GestureDetector(
          onTap: () {}, //inform(_url, context),
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
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _news.sourceName,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                        Text(
                          _news.publishedTime.isNotEmpty
                              ? _news.publishedTime.substring(0, 10)
                              : '',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
