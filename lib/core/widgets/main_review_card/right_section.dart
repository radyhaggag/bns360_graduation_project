part of 'main_review_card.dart';

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ViewReviewsHintBtn(),
        SizedBox(height: 15),
        _RatingProgressRow(
          totalRating: 25,
          numOfRating: 25,
          starNumber: 5,
        ),
        _RatingProgressRow(
          totalRating: 25,
          numOfRating: 20,
          starNumber: 4,
        ),
        _RatingProgressRow(
          totalRating: 25,
          numOfRating: 15,
          starNumber: 3,
        ),
        _RatingProgressRow(
          totalRating: 25,
          numOfRating: 10,
          starNumber: 2,
        ),
        _RatingProgressRow(
          totalRating: 25,
          numOfRating: 5,
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
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(.3),
                fontSize: 7.sp,
              ),
        ),
        const SizedBox(width: 5),
        _RatingProgressLine(
          totalRating: totalRating,
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
