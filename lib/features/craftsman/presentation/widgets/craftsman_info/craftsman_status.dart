part of 'craftsman_info_section.dart';

class _ItemStatusWidget extends StatelessWidget {
  const _ItemStatusWidget({
    required this.start,
    required this.end,
    required this.holiday,
    required this.isWorking24Hours,
  });

  final int start; // Assumes 0 to 24 format
  final int end; // Assumes 0 to 24 format
  final int holiday;
  final bool isWorking24Hours;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppSvg.clock,
          color: context.theme.cardColor,
        ),
        const SizedBox(width: 15),
        Text(
          isWorking24Hours
              ? S.of(context).working_24_hours
              : (_isHoliday ? S.of(context).holiday : status(context)),
          style: context.textTheme.titleSmall?.copyWith(
            color: statusColor,
            fontSize: AppFontSize.details,
          ),
        ),
        if (!_isHoliday && !isWorking24Hours) ...[
          const Spacer(),
          Text(
            openAndClosedHours(context),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.hintColor,
              fontSize: AppFontSize.details,
            ),
          ),
        ],
      ],
    );
  }

  bool get _isHoliday {
    final now = DateTime.now();
    final currentDayName = DateFormat('EEEE', "en").format(now);
    final day = WorkDay.fromString(currentDayName);
    return day == WorkDay.fromId(holiday);
  }

  // Returns the current status based on work hours
  String status(BuildContext context) {
    return TimeDuration.isOpenWithRange24Format(start, end)
        ? S.of(context).working
        : S.of(context).not_working;
  }

  // Return appropriate status color based on work hours
  Color get statusColor {
    return TimeDuration.isOpenWithRange24Format(start, end)
        ? AppColors.green
        : AppColors.red;
  }

  // Format the work hours to be displayed
  String openAndClosedHours(
    BuildContext context,
  ) {
    final formattedStartTime = TimeDuration.from24To12HoursOnly(start, context);
    final formattedEndTime = TimeDuration.from24To12HoursOnly(end, context);
    return '$formattedStartTime - $formattedEndTime';
  }
}
