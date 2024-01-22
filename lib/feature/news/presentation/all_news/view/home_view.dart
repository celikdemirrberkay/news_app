import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/all_news/mixin/home_view_mixin.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidht,
          child: FutureBuilder(
            future: viewModel.fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      snapshot.data![index].title!.toString(),
                    ),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
