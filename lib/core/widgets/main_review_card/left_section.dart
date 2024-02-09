part of 'main_review_card.dart';

class _LeftSection extends StatelessWidget {
  const _LeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Review summary",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: AppFontSize.body,
              ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w),
          child: Text(
            "4.5",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: AppFontSize.subTitle,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        const RatingsItemWithCount(
          starsCount: 4.5,
          numOfRatings: 60,
          addReviewerTxt: true,
          horizontalPadding: 0,
        ),
      ],
    );
  }
}
