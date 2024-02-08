part of 'category_item_slider_section.dart';

class _CategoryItemImage extends StatelessWidget {
  const _CategoryItemImage({
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return MainNetworkImage(
      imageUrl: image,
      width: context.width,
      fit: BoxFit.cover,
    );
  }
}
