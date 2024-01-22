import 'package:news_app/feature/news/domain/model/article.dart';
import 'package:news_app/feature/news/domain/use_case/get_all_news/get_all_news.dart';

class HomeViewModel {
  HomeViewModel(this.useCase);

  final GetAllNewsUseCase useCase;

  /// Fetch news into view model
  Future<List<Article>?> fetchNews() async {
    return useCase.call();
  }
}
