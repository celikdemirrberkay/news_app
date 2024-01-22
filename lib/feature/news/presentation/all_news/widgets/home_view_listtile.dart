part of '../view/home_view.dart';

@immutable
final class _HomeViewListTile extends StatefulWidget {
  const _HomeViewListTile({
    required this.title,
    required this.index,
    required this.imageURL,
  });

  final String title;
  final int index;
  final String imageURL;

  @override
  State<_HomeViewListTile> createState() => __HomeViewListTileState();
}

class __HomeViewListTileState extends State<_HomeViewListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FittedBox(
        child: CachedNetworkImage(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.5),
          fit: BoxFit.fill,
          imageUrl: widget.imageURL,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => _noImageText(),
        ),
      ),
      title: Text(
        widget.title,
        style: GoogleFonts.openSans(
          textStyle: context.bodyLarge?.copyWith(
            overflow: TextOverflow.fade,
            fontWeight: context.fontWeight300,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  Widget _noImageText() => FittedBox(
        child: Text(
          'Upps,No Image!',
          style: GoogleFonts.openSans(),
        ),
      );
}
