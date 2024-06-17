part of 'category_item_info_section.dart';

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
    final adjustedTimes = _validateAndAdjustTimes(start, end);
    final adjustedStart = adjustedTimes.start;
    final adjustedEnd = adjustedTimes.end;

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
              : (_isHoliday
                  ? S.of(context).holiday
                  : status(context, adjustedStart, adjustedEnd)),
          style: context.textTheme.titleSmall?.copyWith(
            color: statusColor(adjustedStart, adjustedEnd),
            fontSize: AppFontSize.details,
          ),
        ),
        if (!_isHoliday && !isWorking24Hours) ...[
          const Spacer(),
          Text(
            openAndClosedHours(context, adjustedStart, adjustedEnd),
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

  // Validate and adjust start and end times
  _ValidatedTimes _validateAndAdjustTimes(int start, int end) {
    // Clamp values to ensure they are between 0 and 24
    int validatedStart = start.clamp(0, 24);
    int validatedEnd = end.clamp(0, 24);

    // Adjust end if start is greater than end
    if (validatedStart > validatedEnd) {
      validatedEnd = (validatedEnd + 12) % 24;
    }

    return _ValidatedTimes(validatedStart, validatedEnd);
  }

  // Determine if the current time is within the work hours
  bool _isOpen(int adjustedStart, int adjustedEnd) {
    if (isWorking24Hours) return true;
    final now = DateTime.now().hour; // Get current hour
    if (adjustedStart < adjustedEnd) {
      return now >= adjustedStart && now < adjustedEnd;
    } else {
      // Case where work time wraps over midnight
      return now >= adjustedStart || now < adjustedEnd;
    }
  }

  // Returns the current status based on work hours
  String status(BuildContext context, int adjustedStart, int adjustedEnd) {
    return _isOpen(adjustedStart, adjustedEnd)
        ? S.of(context).open_now
        : S.of(context).closed_now;
  }

  // Return appropriate status color based on work hours
  Color statusColor(int adjustedStart, int adjustedEnd) {
    return _isOpen(adjustedStart, adjustedEnd)
        ? AppColors.green
        : AppColors.red;
  }

  // Format the work hours to be displayed
  String openAndClosedHours(
      BuildContext context, int adjustedStart, int adjustedEnd) {
    final locale = Localizations.localeOf(context);
    final formattedStartTime = _formatTime(
      adjustedStart,
      locale,
      context: context,
    );
    final formattedEndTime = _formatTime(
      adjustedEnd,
      locale,
      context: context,
    );

    return '$formattedStartTime - $formattedEndTime';
  }

  // Helper method to format time from int to a readable string
  String _formatTime(
    int hour,
    Locale locale, {
    required BuildContext context,
  }) {
    final amOrPm = hour < 12 ? S.of(context).am : S.of(context).pm;
    return "$hour $amOrPm";
  }
}

// Helper class to return validated and adjusted times
class _ValidatedTimes {
  final int start;
  final int end;

  _ValidatedTimes(this.start, this.end);
}
