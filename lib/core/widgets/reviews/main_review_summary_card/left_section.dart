part of 'main_review_summary_card.dart';

class _LeftSection extends StatelessWidget {
  const _LeftSection({
    required this.starsCount,
    required this.numOfRatings,
    required this.showReviewSummaryTxt,
  });

  final num starsCount;
  final int numOfRatings;
  final bool showReviewSummaryTxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showReviewSummaryTxt) ...[
          Text(
            S.of(context).review_summary,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.cardColor,
              fontSize: AppFontSize.body,
            ),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w),
          child: Text(
            starsCount.toStringAsFixed(1),
            style: context.textTheme.titleSmall?.copyWith(
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
