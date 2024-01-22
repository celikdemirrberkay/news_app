import 'package:news_app/feature/news/data/remote/api.dart';
import 'package:news_app/feature/news/domain/model/article.dart';
import 'package:news_app/feature/news/domain/repository/api_service_repository.dart';

class APIServiceRepositoryImpl implements APIServiceRepository {
  APIServiceRepositoryImpl({required this.api});

  /// Request api paramater through constructor
  final API api;

  @override
  Future<List<Article>?> fetchNews() async {
    return api.fetchNews();
  }
}
