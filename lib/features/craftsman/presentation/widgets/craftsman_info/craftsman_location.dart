part of 'craftsman_info_section.dart';

class _CraftsmanLocation extends StatelessWidget {
  const _CraftsmanLocation({
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
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
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // const MapBtn(
        //   mapParams: MapParams(
        //     location: 'Beni Madi',
        //     lat: 28.9826537,
        //     lng: 31.0087249,
        //   ),
        // ),
      ],
    );
  }
}
