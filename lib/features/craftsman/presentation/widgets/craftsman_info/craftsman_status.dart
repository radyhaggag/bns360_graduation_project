part of 'craftsman_info_section.dart';

class _ItemStatusWidget extends StatelessWidget {
  const _ItemStatusWidget({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppSvg.clock),
        const SizedBox(width: 15),
        Text(
          status(context),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: statusColor,
                fontSize: AppFontSize.details,
              ),
        ),
        const Spacer(),
        Text(
          openAndClosedHours(context),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: AppFontSize.details,
              ),
        ),
      ],
    );
  }

  bool get isOpen {
    final now = DateTime.now();
    bool isOpen = now.isAfter(start) && now.isBefore(end);

    return isOpen;
  }

  String status(BuildContext context) {
    if (isOpen) return S.of(context).open_now;
    return S.of(context).closed_now;
  }

  Color get statusColor {
    if (isOpen) return AppColors.green;
    return AppColors.red;
  }

  String openAndClosedHours(BuildContext context) {
    final locale = context.currentLanguage.locale;
    final formattedStartTime = DateFormat.j(locale?.languageCode).format(start);
    final formattedEndTime = DateFormat.j(locale?.languageCode).format(end);

    return '$formattedStartTime - $formattedEndTime';
  }
}
