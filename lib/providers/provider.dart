import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source.dart';

class Provider {
  static const String _API_KEY = '149f7edfe1294ebcba6cac4b97c37031';
  static const String _BASE_URL = 'https://newsapi.org/v2/top-headlines';
  static const String _SOURCE_URL = '/sources';

  Future<List<NewsModel>> getNews(List<Source> source) async {
    String url;
    if (source.isEmpty) {
      url = '$_BASE_URL?country=in&apiKey=$_API_KEY';
    } else {
      List<String> _sources = source.map(
        (s) {
          return s.id;
        },
      ).toList();
      url = '$_BASE_URL?sources=${_sources.join(',')}&apiKey=$_API_KEY';
    }
    print(url);
    final response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List jsonList = json['articles'];
      return jsonList.map((data) => new NewsModel.fromApi(data)).toList();
    } else {
      throw Exception(json['message']);
    }
  }

  Future<List<Source>> getSources() async {
    String url = '$_BASE_URL$_SOURCE_URL?apiKey=$_API_KEY';
    print(url);
    final response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    if (json['status'] == 'ok') {
      List jsonList = json['sources'];
      return jsonList
          .map((sourceJson) => new Source.fromApi(sourceJson))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
