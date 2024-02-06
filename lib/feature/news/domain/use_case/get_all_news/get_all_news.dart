import 'package:news_app/feature/news/data/repository/api_service_repository_impl.dart';
import 'package:news_app/feature/news/domain/model/article.dart';
import 'package:news_app/feature/news/domain/repository/api_service_repository.dart';

/// All news fetching use case
class GetAllNewsUseCase {
  GetAllNewsUseCase({required this.repository});

  final APIServiceRepository repository;

  /// Execute api call from use case
  Future<List<Article>?> call(String queryParam) async {
    return repository.fetchNews(queryParam);
  }
}
