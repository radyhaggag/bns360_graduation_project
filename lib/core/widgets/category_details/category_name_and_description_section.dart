part of 'category_details_card.dart';

class _CategoryDetailsNameAndDescriptionSection extends StatelessWidget {
  const _CategoryDetailsNameAndDescriptionSection({
    required this.categoryDetailsEntity,
  });

  final CategoryDetailsEntity categoryDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLocalizedString(
              context,
              ar: categoryDetailsEntity.nameAR,
              en: categoryDetailsEntity.nameEN,
            ),
            style: AppStyles.getSemiBoldStyle(),
          ),
          const SizedBox(height: 10),
          Text(
            getLocalizedString(
              context,
              ar: categoryDetailsEntity.descriptionAR,
              en: categoryDetailsEntity.descriptionEN,
            ),
            style: AppStyles.getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
