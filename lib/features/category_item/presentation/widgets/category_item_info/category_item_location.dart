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
        const _MapBtn(),
      ],
    );
  }
}

class _MapBtn extends StatelessWidget {
  const _MapBtn();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: S.of(context).map,
      width: 90.w,
      height: 35.h,
      onPressed: () {},
    );
  }
}
