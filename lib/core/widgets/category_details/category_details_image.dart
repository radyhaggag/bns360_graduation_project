part of 'category_details_card.dart';

class _CategoryDetailsImage extends StatelessWidget {
  final String imageUrl;
  const _CategoryDetailsImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 250.w,
        height: 150.h,
        fit: BoxFit.fill,
      ),
    );
  }
}
