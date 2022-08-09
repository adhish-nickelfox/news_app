import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsList extends StatelessWidget {
  final Future<List<NewsModel>> _newsList;
  NewsList(this._newsList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(5),
      child: FutureBuilder<List<NewsModel>>(
        future: _newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<NewsModel> data = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                final NewsModel _news = data[index];
                return NewsItem(_news);
              },
              itemCount: data.length,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
