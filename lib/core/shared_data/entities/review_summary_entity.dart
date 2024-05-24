import 'package:equatable/equatable.dart';

class ReviewSummaryEntity extends Equatable {
  final int totalReviews;
  final double averageRating;
  final int fiveStars;
  final int fourStars;
  final int threeStars;
  final int twoStars;
  final int oneStars;

  const ReviewSummaryEntity({
    required this.totalReviews,
    required this.averageRating,
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStars,
  });

  @override
  List<Object?> get props => [
        totalReviews,
        averageRating,
        fiveStars,
        fourStars,
        threeStars,
        twoStars,
        oneStars,
      ];

      const ReviewSummaryEntity.empty()
          : totalReviews = 0,
            averageRating = 0.0,
            fiveStars = 0,
            fourStars = 0,
            threeStars = 0,
            twoStars = 0,
            oneStars = 0;
}
