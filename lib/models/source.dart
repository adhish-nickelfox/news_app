class Source {
  final String id;
  final String title;
  bool isSelected = false;

  Source({required this.id, required this.title});

  factory Source.fromApi(Map<String, dynamic> json) {
    Source source = Source(
      id: json['id'] ?? '',
      title: json['name'] ?? '',
    );
    return source;
  }
}
