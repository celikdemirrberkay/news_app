import 'package:flutter/material.dart';
import 'package:news_app/core/config/router/app_router.dart';
import 'package:news_app/core/init/app_init.dart';
import 'package:news_app/core/theme/color/app_colors.dart';
import 'package:news_app/feature/news/presentation/all_news/view/home_view.dart';

Future<void> main() async {
  await AppInit.execute();
  runApp(const NewsApp());
}

/// Root widget of app
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainBlue),
        useMaterial3: true,
      ),
    );
  }
}
