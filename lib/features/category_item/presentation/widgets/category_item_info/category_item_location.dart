part of 'category_item_info_section.dart';

class _CategoryItemLocation extends StatelessWidget {
  const _CategoryItemLocation({
    required this.categoryItemEntity,
  });
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    final location = LocalizationHelper.getLocalizedString(
      context,
      ar: categoryItemEntity.businessAddressArabic,
      en: categoryItemEntity.businessAddressEnglish,
    );
    return Row(
      children: [
        SvgPicture.asset(
          AppSvg.marker,
          color: context.theme.cardColor,
          width: 20.r,
          height: 20.r,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            location,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: AppFontSize.details,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 15),
        MapBtn(
          mapParams: MapParams(
            location: location,
            lat: categoryItemEntity.latitude,
            lng: categoryItemEntity.longitude,
            isReadOnly: true,
          ),
        ),
      ],
    );
  }
}
