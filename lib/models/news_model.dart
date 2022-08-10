class NewsModel {
  final String title;
  final String imageUrl;
  final String sourceName;
  final String publishedTime;
  final String sourceUrl;

  NewsModel(
      {required this.title,
      required this.imageUrl,
      required this.sourceName,
      required this.publishedTime,
      required this.sourceUrl});

  factory NewsModel.fromApi(Map<String, dynamic> json) {
    return NewsModel(
        title: json['title'] ?? '',
        imageUrl: json['urlToImage'] ?? '',
        sourceName: json['author'] ?? '',
        publishedTime: json['publishedAt'] ?? '',
        sourceUrl: json['url'] ?? '');
  }
}
