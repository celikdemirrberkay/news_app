import 'package:go_router/go_router.dart';
import 'package:news_app/feature/news/presentation/all_news/view/home_view.dart';
import 'package:news_app/feature/news/presentation/news_detail/view/news_detail_view.dart';
import 'package:news_app/feature/news/presentation/splash/view/splash_view.dart';

import '../../enum/router_constants.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    /// Splash page route
    GoRoute(
      path: RouteConst.splash.rawValue,
      builder: (context, state) {
        return const SplashView();
      },
    ),

    /// Home page route
    GoRoute(
      path: RouteConst.home.rawValue,
      builder: (context, state) {
        return const HomeView();
      },
    ),

    /// Home page route
    GoRoute(
      path: '${RouteConst.detail.rawValue}/:title/:content',
      builder: (context, state) {
        return NewsDetailView(
          title: state.pathParameters['title'],
          content: state.pathParameters['content'],
        );
      },
    ),
  ],
);
