part of 'category_item_card.dart';

class _CategoryItemNameAndDescriptionSection extends StatelessWidget {
  const _CategoryItemNameAndDescriptionSection({
    required this.categoryDetailsEntity,
  });

  final CategoryItemEntity categoryDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalizationHelper.getLocalizedString(
              context,
              ar: categoryDetailsEntity.nameAR,
              en: categoryDetailsEntity.nameEN,
            ),
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              LocalizationHelper.getLocalizedString(
                context,
                ar: categoryDetailsEntity.descriptionAR,
                en: categoryDetailsEntity.descriptionEN,
              ),
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
