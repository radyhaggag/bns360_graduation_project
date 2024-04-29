part of 'category_item_card.dart';

class _CategoryItemImage extends StatelessWidget {
  const _CategoryItemImage({required this.categoryItemEntity});

  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.categoryItem,
          arguments: categoryItemEntity,
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: MainNetworkImage(
          imageUrl: categoryItemEntity.profilePictureUrl,
          width: 250.w,
          height: 125.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
