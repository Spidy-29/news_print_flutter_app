import 'dart:convert';

import 'package:news_print_app/models/article_object.dart';

class ResponseObject {
  final String status;
  final int totalResults;
  final List<ArticleObject> articles;

  ResponseObject({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }

  factory ResponseObject.fromMap(Map<String, dynamic> map) {
    return ResponseObject(
      status: map['status'] ?? '',
      totalResults: map['totalResults'] ?? 0,
      articles: map['articles'] ?? [],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ResponseObject.fromJson(String source) =>
      ResponseObject.fromMap(jsonDecode(source));
}
