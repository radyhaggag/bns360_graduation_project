part of 'category_item_card.dart';

class _CategoryItemImage extends StatelessWidget {
  const _CategoryItemImage({required this.categoryItemEntity});

  final CategoryItemInfoEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.categoryItem,
          arguments: CategoryItemScreenParams(
            itemId: categoryItemEntity.id,
            categoryItemInfoEntity: categoryItemEntity,
            isBelongToMe: false,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: MainNetworkImage(
          imageUrl: categoryItemEntity.profileImageName,
          width: 250.w,
          height: 125.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
