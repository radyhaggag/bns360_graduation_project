part of 'property_card.dart';

class _PropertyLocationAndAreaSection extends StatelessWidget {
  const _PropertyLocationAndAreaSection({required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: PropertyAddressWidget(
            address: LocalizationHelper.getLocalizedString(
              context,
              ar: propertyEntity.arabicAddress,
              en: propertyEntity.englishAddress,
            ),
            markerColor: Colors.amberAccent,
          ),
        ),
        const SizedBox(width: 10),
        PropertyAreaWidget(
          area: propertyEntity.area.toString(),
        ),
      ],
    );
  }
}
