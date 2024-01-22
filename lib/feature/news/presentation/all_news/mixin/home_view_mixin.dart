import 'package:flutter/material.dart';
import 'package:news_app/feature/news/data/dependencyinjection/injection_container.dart';
import 'package:news_app/feature/news/presentation/all_news/view/home_view.dart';
import 'package:news_app/feature/news/presentation/all_news/viewmodel/home_view_model.dart';

mixin HomeViewMixin on State<HomeView> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(sl());
  }
}
