/// Network constants of our app
class NetworkConstants {
  ///Base url of News API
  static const String baseUrl = 'https://newsapi.org/v2/';

  /// API Key for queries
  static const String apiKey = '1e53e747a984461c9a34d5cbef7412f1';

  /// End point for all news
  static const String endPoint = 'top-headlines?country=us&apiKey=$apiKey';
}
