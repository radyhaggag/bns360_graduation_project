part of 'conversations_card.dart';

class _MessageDateAndUnreadCountSection extends StatelessWidget {
  const _MessageDateAndUnreadCountSection({
    this.lastMessageDate,
    required this.unreadCount,
  });

  final DateTime? lastMessageDate;
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lastMessageDate != null
                ? DateFormatter.dateFormatForDisplay(
                    context: context,
                    dateTime: lastMessageDate!,
                    showTimeIfToday: true,
                  )
                : "",
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.primaryColor.withOpacity(.4),
              fontSize: AppFontSize.light,
            ),
          ),
          SizedBox(height: 5.h),
          if (unreadCount > 0)
            Container(
              alignment: Alignment.center,
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  unreadCount.toString(),
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.theme.highlightColor,
                    fontSize: AppFontSize.light,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
