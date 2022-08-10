import 'package:flutter/material.dart';
import './models/news_model.dart';
import './models/source.dart';
import './providers/provider.dart';

import './widgets/heading.dart';
import './widgets/news_list.dart';
import './widgets/source_item.dart';
import './widgets/sub_heading.dart';

void main() => runApp(NewsApp());

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late Future<List<NewsModel>> newsList;
  late Future<List<Source>> sourceList;
  List<Source> _selectedSourceList = [];

  @override
  void initState() {
    super.initState();
    newsList = Provider().getNews(_selectedSourceList);
    sourceList = Provider().getSources();
    //add compute/isolate
  }

  updateSource(Source sourceSelected) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "News App",
          ),
        ),
        body: Column(children: <Widget>[
          SubHeading('Select a source to get the news:'),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 45,
            child: FutureBuilder<List<Source>>(
              future: sourceList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Source> list = snapshot.data!;
                  return ListView.builder(
                    itemBuilder: ((context, index) {
                      Source s = list[index];
                      if (_selectedSourceList.contains(s)) s.isSelected = true;
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              s.isSelected
                                  ? _selectedSourceList.remove(s)
                                  : _selectedSourceList.add(s);
                              s.isSelected = !s.isSelected;

                              newsList =
                                  Provider().getNews(_selectedSourceList);
                            });
                          },
                          child: SourceItem(s));
                    }),
                    scrollDirection: Axis.horizontal,
                  );
                } else {
                  return Text('${snapshot.error}');
                }
              },
            ),
          ),
          Heading('Headlines'),
          NewsList(newsList)
        ]),
      ),
    );
  }
}
