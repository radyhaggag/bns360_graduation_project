part of 'property_card.dart';

class _PropertyLocationAndAreaSection extends StatelessWidget {
  const _PropertyLocationAndAreaSection({required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PropertyAddressWidget(
          address: propertyEntity.address,
          markerColor: Colors.amberAccent,
        ),
        PropertyAreaWidget(
          area: propertyEntity.area,
        ),
      ],
    );
  }
}
