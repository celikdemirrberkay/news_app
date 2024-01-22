import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/feature/news/data/remote/api.dart';
import 'package:news_app/feature/news/data/repository/api_service_repository_impl.dart';
import 'package:news_app/feature/news/domain/use_case/get_all_news/get_all_news.dart';

/// Get it object
final sl = GetIt.instance;

/// Set up singleton
Future<void> setup() async {
  /// Register API Service
  sl
    ..registerSingleton<API>(API(http.Client()))

    /// Register type [APIServiceRepositoryImpl] [APIServiceRepositoryImpl]
    ..registerSingleton<APIServiceRepositoryImpl>(APIServiceRepositoryImpl(api: sl()))

    /// Register [GetAllNewsUseCase]
    ..registerSingleton<GetAllNewsUseCase>(GetAllNewsUseCase(repository: sl()));
}
