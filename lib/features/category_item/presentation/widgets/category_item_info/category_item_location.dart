part of 'category_item_info_section.dart';

class _CategoryItemLocation extends StatelessWidget {
  const _CategoryItemLocation({
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvg.marker,
          color: Theme.of(context).cardColor,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            location,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: AppFontSize.details,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const MapBtn(
          mapParams: MapParams(
            location: 'Beni Madi',
            lat: 28.9826537,
            lng: 31.0087249,
          ),
        ),
      ],
    );
  }
}
