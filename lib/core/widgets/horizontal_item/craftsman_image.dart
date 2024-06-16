part of 'horizontal_item_card.dart';

class _CategoryItemImage extends StatelessWidget {
  final String imageUrl;
  const _CategoryItemImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return MainNetworkImage(
      imageUrl: imageUrl,
      width: 60.r,
      height: 60.r,
      fit: BoxFit.cover,
      isCircular: true,
    );
  }
}
