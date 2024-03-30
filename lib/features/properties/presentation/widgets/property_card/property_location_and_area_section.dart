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
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.amberAccent,
              size: 20.r,
            ),
            const SizedBox(width: 5),
            Text(
              propertyEntity.address,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: AppFontSize.light,
                color: context.theme.primaryColor.withOpacity(.6),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.aspect_ratio_rounded,
              color: context.theme.cardColor,
              size: 20.r,
            ),
            const SizedBox(width: 5),
            Text(
              propertyEntity.area,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: AppFontSize.light,
                color: context.theme.primaryColor.withOpacity(.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
