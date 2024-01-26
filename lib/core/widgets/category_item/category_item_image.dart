part of 'category_item_card.dart';

class _CategoryItemImage extends StatelessWidget {
  final String imageUrl;
  const _CategoryItemImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: MainNetworkImage(
        imageUrl: imageUrl,
        width: 250.w,
        height: 125.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
