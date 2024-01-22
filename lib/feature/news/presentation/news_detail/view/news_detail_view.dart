import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/theme/color/app_colors.dart';

/// Detail view of news
@immutable
final class NewsDetailView extends StatefulWidget {
  /// News detail view
  const NewsDetailView({
    required this.title,
    required this.content,
    super.key,
  });

  final String? title;
  final String? content;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarTextForDetailView(context),
      body: SafeArea(
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidht,
          child: Column(
            children: [
              context.spacerWithFlex(flex: 1),
              Expanded(flex: 10, child: _detailLottie()),
              context.spacerWithFlex(flex: 1),
              Expanded(flex: 2, child: _textOfTitle()),
              context.spacerWithFlex(flex: 1),
              Expanded(flex: 10, child: _contentText()),
            ],
          ),
        ),
      ),
    );
  }

  /// Detail screen lottie
  Widget _detailLottie() => Lottie.asset('assets/lotties/newsdetail.json');

  /// Content of news
  Widget _contentText() => ListView(
        children: [
          Text(
            widget.content.toString(),
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              textStyle: context.bodyLarge?.copyWith(),
            ),
          ),
        ],
      );

  /// Text of title
  Widget _textOfTitle() => Text(
        '${widget.title}',
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(
          textStyle: context.bodyMedium?.copyWith(
            fontWeight: context.fontWeightBold,
            color: AppColors.mainBlue,
          ),
        ),
      );

  /// Breaking Views app bar
  AppBar _appBarTextForDetailView(BuildContext context) {
    return AppBar(
      title: Text(
        'Breaking News!',
        style: GoogleFonts.pacifico(
          textStyle: context.headlineMedium?.copyWith(
            color: AppColors.mainBlue,
          ),
        ),
      ),
    );
  }
}
