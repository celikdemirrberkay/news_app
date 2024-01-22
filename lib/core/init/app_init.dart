import 'package:news_app/feature/news/data/dependencyinjection/injection_container.dart';

/// App initialization bussiness
class AppInit {
  /// Execute app needed
  static Future<void> execute() async {
    await setup();
  }
}
