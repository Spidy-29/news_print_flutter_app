import 'dart:convert';

class SourcesObject {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  SourcesObject({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country,
    };
  }

  factory SourcesObject.fromMap(Map<String, dynamic> map) {
    return SourcesObject(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        url: map['url'] ?? '',
        category: map['category'] ?? '',
        language: map['language'] ?? '',
        country: map['country'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory SourcesObject.fromJson(String source) {
    return SourcesObject.fromMap(jsonDecode(source));
  }
}
