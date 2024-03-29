part of 'category_item_card.dart';

class _CategoryItemNameAndDescriptionSection extends StatelessWidget {
  const _CategoryItemNameAndDescriptionSection({
    required this.categoryItemEntity,
  });

  final CategoryItemEntity categoryItemEntity;

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
                arguments: categoryItemEntity,
              );
            },
            child: Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: categoryItemEntity.nameAR,
                en: categoryItemEntity.nameEN,
              ),
              style: context.textTheme.titleSmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: categoryItemEntity.descriptionAR,
                en: categoryItemEntity.descriptionEN,
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
