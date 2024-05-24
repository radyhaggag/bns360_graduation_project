part of 'main_review_summary_card.dart';

class _RightSection extends StatelessWidget {
  const _RightSection({
    required this.showViewAllBtn,
    this.onViewAllTap,
    this.fiveStarCount = 0,
    this.fourStarCount = 0,
    this.threeStarCount = 0,
    this.twoStarCount = 0,
    this.oneStarCount = 0,
  });
  final bool showViewAllBtn;
  final void Function()? onViewAllTap;

  final int fiveStarCount;
  final int fourStarCount;
  final int threeStarCount;
  final int twoStarCount;
  final int oneStarCount;

  int get _totalRating {
    return fiveStarCount +
        fourStarCount +
        threeStarCount +
        twoStarCount +
        oneStarCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showViewAllBtn) ...[
          _ViewReviewsHintBtn(
            onViewAllTap: onViewAllTap,
          ),
          const SizedBox(height: 15),
        ],
         _RatingProgressRow(
          totalRating: _totalRating,
          numOfRating: fiveStarCount,
          starNumber: 5,
        ),
         _RatingProgressRow(
          totalRating: _totalRating,
          numOfRating: fourStarCount,
          starNumber: 4,
        ),
         _RatingProgressRow(
          totalRating: _totalRating,
          numOfRating: threeStarCount,
          starNumber: 3,
        ),
         _RatingProgressRow(
          totalRating: _totalRating,
          numOfRating: twoStarCount,
          starNumber: 2,
        ),
         _RatingProgressRow(
          totalRating: _totalRating,
          numOfRating: oneStarCount,
          starNumber: 1,
        ),
      ],
    );
  }
}

class _RatingProgressRow extends StatelessWidget {
  const _RatingProgressRow({
    required this.totalRating,
    required this.numOfRating,
    required this.starNumber,
  });

  final int starNumber;
  final int totalRating;
  final int numOfRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          starNumber.toString(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.primaryColor.withOpacity(.3),
            fontSize: 7.sp,
          ),
        ),
        const SizedBox(width: 5),
        _RatingProgressLine(
          totalRating: totalRating == numOfRating ? totalRating + 1 : totalRating,
          numOfRating: numOfRating,
        ),
      ],
    );
  }
}

class _RatingProgressLine extends StatelessWidget {
  const _RatingProgressLine({
    required this.totalRating,
    required this.numOfRating,
  });

  final int totalRating;
  final int numOfRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      width: lineWidth,
      decoration: BoxDecoration(
        color: AppColors.light,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.bottomLeft,
      child: Container(
        color: AppColors.primary,
        width: ratingEquation * lineWidth,
      ),
    );
  }

  double get lineWidth {
    return 100.w;
  }

  double get ratingEquation {
    return ((numOfRating / totalRating) / 100) * 100;
  }
}
