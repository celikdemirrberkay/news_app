import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/theme/color/app_colors.dart';
import 'package:news_app/feature/news/presentation/all_news/mixin/home_view_mixin.dart';
import 'package:news_app/feature/news/presentation/all_news/state/country_state.dart';

part '../widgets/home_view_bottomsheet.dart';
part '../widgets/home_view_listtile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.focusScope.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _homePageAppBar(),
        body: SafeArea(
          child: SizedBox(
            height: context.screenHeight,
            width: context.screenWidht,
            child: Column(
              children: [
                Expanded(flex: 10, child: _searchTextField()),
                const Expanded(child: Divider()),
                Expanded(flex: 90, child: _newsListViewFutureBuilder()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchTextField() => Padding(
        padding: context.symmetricPaddingLow,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Search news',
            border: OutlineInputBorder(borderRadius: context.circularBorderRadius(radius: 20)),
            suffixIcon: IconButton(
              onPressed: () {
                query.value = textEditingController.text;
                setState(() {});
              },
              icon: const Icon(
                Icons.search_rounded,
                color: AppColors.mainBlue,
              ),
            ),
          ),
        ),
      );

  AppBar _homePageAppBar() {
    return AppBar(
      title: _breakingNewsText(),
      leading: _refreshButton(),
      actions: [
        IconButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: _chooseCategoryModalBottomSheet,
          ),
          icon: const Icon(
            Icons.settings,
            color: AppColors.mainBlue,
          ),
        ),
      ],
    );
  }

  /// Must be tap refresh button after change region
  Widget _refreshButton() {
    return IconButton(
      onPressed: () => setState(() {}),
      icon: const Icon(
        Icons.refresh,
        color: AppColors.mainBlue,
      ),
    );
  }

  /// Home view bottom sheet
  Widget _chooseCategoryModalBottomSheet(BuildContext context) => _HomeViewBottomSheet();

  /// Breaking news text of home view
  Widget _breakingNewsText() => Padding(
        padding: context.symmetricPaddingLow,
        child: FittedBox(
          child: Text(
            'Breaking News!',
            style: GoogleFonts.pacifico(
              color: AppColors.mainBlue,
              textStyle: context.appTextTheme.headlineMedium?.copyWith(
                fontWeight: context.fontWeight300,
              ),
            ),
          ),
        ),
      );

  /// Future builder of home page
  /// This layer is responsible for fetching news
  Widget _newsListViewFutureBuilder() {
    return ValueListenableBuilder(
      valueListenable: query,
      builder: (context, value, child) => FutureBuilder(
        future: viewModel.fetchNews(value), // ---> Empty queryParam fetch all datas
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return _errorText();
            case ConnectionState.waiting:
              return _circularProgressIndicator();
            case ConnectionState.active:
              return _circularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => _HomeViewListTile(
                    imageURL: snapshot.data?[index].urlToImage.toString(),
                    title: snapshot.data![index].title.toString(),
                    index: index,
                  ),
                );
              } else {
                return _errorText();
              }
          }
        },
      ),
    );
  }

  /// Circular progress indicator for [FutureBuilder]
  Widget _circularProgressIndicator() => const Center(
        child: CircularProgressIndicator(
          color: AppColors.mainBlue,
        ),
      );

  /// Error text for [FutureBuilder]
  Widget _errorText() => const Text('Something went wrong');
}
