import 'package:mockito/mockito.dart';
import 'package:news_app/feature/news/domain/model/article.dart';
import 'package:news_app/feature/news/domain/use_case/get_all_news/get_all_news.dart';
import 'package:test/test.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetAllNewsUseCase getAllNewsUseCase;
  late MockAPIServiceRepository mockAPIServiceRepository;

  /// Setting up our test needed.
  setUp(() {
    mockAPIServiceRepository = MockAPIServiceRepository();
    getAllNewsUseCase = GetAllNewsUseCase(repository: mockAPIServiceRepository);
  });

  /// Testing our get all news use case
  test('Get all news use case test', () async {
    /// arrange
    when(mockAPIServiceRepository.fetchNews('')).thenAnswer(
      (_) async => <Article>[],
    );

    /// act
    final result = await getAllNewsUseCase.call('');

    /// assert
    expect(result, <Article>[]);
  });
}
