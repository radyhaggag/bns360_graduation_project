part of 'category_item_card.dart';

class _CategoryItemNameAndDescriptionSection extends StatelessWidget {
  const _CategoryItemNameAndDescriptionSection({
    required this.categoryItemEntity,
  });

  final CategoryItemInfoEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
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
            child: Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: categoryItemEntity.businessNameArabic,
                en: categoryItemEntity.businessNameEnglish,
              ),
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.details,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: categoryItemEntity.businessDescriptionArabic ?? "",
                en: categoryItemEntity.businessDescriptionEnglish ?? "",
              ),
              style: context.textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
