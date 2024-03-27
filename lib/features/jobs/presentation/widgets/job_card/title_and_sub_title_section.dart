part of 'job_card.dart';

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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: AppFontSize.subTitle,
                ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: AppFontSize.light,
                  color: Theme.of(context).primaryColor.withOpacity(.25),
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
