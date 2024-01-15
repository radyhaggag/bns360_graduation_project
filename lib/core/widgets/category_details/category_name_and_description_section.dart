part of 'category_details_card.dart';

class _CategoryDetailsNameAndDescriptionSection extends StatelessWidget {
  const _CategoryDetailsNameAndDescriptionSection({
    required this.categoryDetailsEntity,
  });

  final CategoryDetailsEntity categoryDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLocalizedString(
              context,
              ar: categoryDetailsEntity.nameAR,
              en: categoryDetailsEntity.nameEN,
            ),
            style: AppStyles.getSemiBoldStyle(
              fontSize: AppFontSize.body,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Text(
            getLocalizedString(
              context,
              ar: categoryDetailsEntity.descriptionAR,
              en: categoryDetailsEntity.descriptionEN,
            ),
            style: AppStyles.getLightStyle(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
