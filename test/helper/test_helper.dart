import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:news_app/feature/news/domain/repository/api_service_repository.dart';

@GenerateMocks(
  [APIServiceRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
