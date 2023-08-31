import 'dart:convert';

class RequestObject {
  final String country;
  final String category;
  final int pageSize;
  final int page;

  RequestObject({
    required this.country,
    required this.category,
    required this.pageSize,
    required this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'category': category,
      'pageSize': pageSize,
      'page': page,
    };
  }

  factory RequestObject.fromMap(Map<String, dynamic> map) {
    return RequestObject(
      country: map['country'] ?? '',
      category: map['category'] ?? '',
      pageSize: map['pageSize'] ?? 0,
      page: map['page'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestObject.fromJson(String source) =>
      RequestObject.fromMap(json.decode(source));
}
