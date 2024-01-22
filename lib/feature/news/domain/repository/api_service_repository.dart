import 'package:news_app/feature/news/domain/model/article.dart';

/// Make abstraction of repository for testing
mixin APIServiceRepository {
  /// Make abstraction of fetch news func
  Future<List<Article>?> fetchNews();
}
