import 'package:news_app/feature/news/domain/model/source.dart';

/// Article Model
class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  /// Constructor paramater
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source'] as Map<String, dynamic>);
    author = json['author'].toString();
    title = json['title'].toString();
    description = json['description'].toString();
    url = json['url'].toString();
    urlToImage = json['urlToImage'].toString();
    publishedAt = json['publishedAt'].toString();
    content = json['content'].toString();
  }
}
