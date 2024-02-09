part of 'main_review_card.dart';

class _LeftSection extends StatelessWidget {
  const _LeftSection({
    required this.starsCount,
    required this.numOfRatings,
  });

  final num starsCount;
  final int numOfRatings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).review_summary,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: AppFontSize.body,
              ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w),
          child: Text(
            starsCount.toString(),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: AppFontSize.subTitle,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        RatingsItemWithCount(
          starsCount: starsCount,
          numOfRatings: numOfRatings,
          addReviewerTxt: true,
          horizontalPadding: 0,
        ),
      ],
    );
  }
}
