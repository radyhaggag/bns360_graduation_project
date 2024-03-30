part of 'property_card.dart';

class _TitleAndDateSection extends StatelessWidget {
  const _TitleAndDateSection({
    required this.title,
    required this.date,
  });

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: AppFontSize.light,
              color: context.theme.cardColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            getDate(context),
            style: context.textTheme.bodyLarge?.copyWith(
              fontSize: AppFontSize.light,
              color: context.theme.primaryColor.withOpacity(.25),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String getDate(BuildContext context) {
    return DateFormatter.getSuitableDateString(
      context: context,
      date: date,
      showFullDateHours: false,
    );
  }
}
