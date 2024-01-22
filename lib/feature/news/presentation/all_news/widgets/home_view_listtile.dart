part of '../view/home_view.dart';

@immutable
final class _HomeViewListTile extends StatefulWidget {
  const _HomeViewListTile({
    required this.title,
    required this.index,
    required this.imageURL,
    required this.content,
  });

  final String title;
  final int index;
  final String? imageURL;
  final String? content;

  @override
  State<_HomeViewListTile> createState() => __HomeViewListTileState();
}

class __HomeViewListTileState extends State<_HomeViewListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '${RouteConst.detail.rawValue}/${widget.title}/${widget.content}',
      ),
      child: ListTile(
        leading: FittedBox(
          child: CachedNetworkImage(
            height: context.dynamicHeight(0.1),
            width: context.dynamicWidth(0.5),
            fit: BoxFit.fill,
            imageUrl: widget.imageURL ?? 'https://via.assets.so/img.jpg?w=400&h=150&tc=blue&bg=#cecece',
            placeholder: (context, url) => _circularIndicator(),
            errorWidget: (context, url, error) => _noImageText(),
            errorListener: (value) => null,
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
      ),
    );
  }

  /// While image downloading we show circular indicator as a placeholder
  Widget _circularIndicator() => FittedBox(child: const CircularProgressIndicator());

  /// If there is no image return from api we put this text as a image
  Widget _noImageText() => FittedBox(
        child: Text(
          'Upps,No Image!',
          style: GoogleFonts.openSans(),
        ),
      );
}
