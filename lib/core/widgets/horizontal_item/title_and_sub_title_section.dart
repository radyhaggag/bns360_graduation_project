part of 'horizontal_item_card.dart';

class _TitleAndSubTitleSection extends StatelessWidget {
  const _TitleAndSubTitleSection({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

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
              fontSize: AppFontSize.details,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          FittedBox(
            child: Text(
              subTitle,
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: AppFontSize.light,
                color: context.theme.primaryColor.withOpacity(.25),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
