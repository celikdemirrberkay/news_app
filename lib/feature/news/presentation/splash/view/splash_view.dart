import 'package:dart_vader/dart_vader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/enum/router_constants.dart';

import '../../../../../core/theme/color/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.screenHeight,
          width: context.screenWidht,
          child: Column(
            children: [
              Expanded(flex: 80, child: _splashLottie()),
              Expanded(flex: 10, child: _breakingNewsText()),
              context.spacerWithFlex(flex: 5),
              Expanded(flex: 10, child: _circularProgressIndicator()),
              context.spacerWithFlex(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  /// Loading widget
  Widget _circularProgressIndicator() => Center(child: CircularProgressIndicator());

  /// Splash page lottie animation
  Widget _splashLottie() => Lottie.asset(
        'assets/lotties/news.json',
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
              () => context.push(RouteConst.home.rawValue),
            );
        },
      );

  /// Splash page breaking news text
  Widget _breakingNewsText() => Padding(
        padding: context.symmetricPaddingLow,
        child: FittedBox(
          child: Text(
            'Breaking News!',
            style: GoogleFonts.pacifico(
              textStyle: context.bodyLarge?.copyWith(
                color: AppColors.mainBlue,
              ),
            ),
          ),
        ),
      );
}
