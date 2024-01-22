import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/network_constants.dart';
import 'package:news_app/feature/news/domain/model/article.dart';

/// Service API class
/// Fetching news data as JSON
class API {
  API(this.client);

  final http.Client client;

  /// Making nullable fetch news
  Future<List<Article>?> fetchNews() async {
    /// URI for fetching news data
    final uri = Uri.parse(NetworkConstants.baseUrl + NetworkConstants.endPoint);

    /// Fetching JSON
    final response = await client.get(uri);

    /// Convert to Map<String,dynamic> --> [{source:"..."}] for ex.
    final json = jsonDecode(response.body);

    final body = json['articles'] as List<dynamic>?;

    // ignore: lines_longer_than_80_chars
    final articles = body?.map((dynamic item) => Article.fromJson(item as Map<String, dynamic>)).toList();

    /// Returning List of [Article]
    return articles;
  }
}
