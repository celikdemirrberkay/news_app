part of '../view/home_view.dart';

class _HomeViewBottomSheet extends StatefulWidget {
  const _HomeViewBottomSheet({super.key});

  @override
  State<_HomeViewBottomSheet> createState() => __HomeViewBottomSheetState();
}

class __HomeViewBottomSheetState extends State<_HomeViewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidht,
      height: context.dynamicHeight(0.5),
      child: Column(
        children: [
          Expanded(child: _chooseCountryText(context)),
          Expanded(
            child: GestureDetector(
              onTap: () {
                countrySelection.value = 'tr';
              },
              child: FittedBox(
                child: Text(
                  '🇹🇷',
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                countrySelection.value = 'us';
              },
              child: FittedBox(
                child: Text(
                  '🇺🇸',
                ),
              ),
            ),
          ),
          Expanded(child: _youMustRefreshText()),
        ],
      ),
    );
  }

  Widget _youMustRefreshText() => Padding(
        padding: context.symmetricPaddingMedium,
        child: FittedBox(
          child: Text(
            'You must press refresh button after select region\nto see the result',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              color: AppColors.mainBlue,
            ),
          ),
        ),
      );

  Widget _chooseCountryText(BuildContext context) {
    return Padding(
      padding: context.symmetricPaddingHigh,
      child: FittedBox(
        child: Text(
          'Which country\'s news would you\nlike to see?',
          textAlign: TextAlign.center,
          style: GoogleFonts.openSans(
            textStyle: context.bodyLarge?.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
        ),
      ),
    );
  }
}
