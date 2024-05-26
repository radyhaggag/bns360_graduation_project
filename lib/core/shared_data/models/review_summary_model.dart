import '../entities/review_summary_entity.dart';

class ReviewSummaryModel extends ReviewSummaryEntity {
  const ReviewSummaryModel({
    required super.totalReviews,
    required super.averageRating,
    required super.fiveStars,
    required super.fourStars,
    required super.threeStars,
    required super.twoStars,
    required super.oneStars,
  });

  factory ReviewSummaryModel.fromJson(Map<String, dynamic> json) {
    return ReviewSummaryModel(
      totalReviews: json['TotalReviews'],
      averageRating: (json['AverageRating'] as num).toDouble(),
      fiveStars: json['FiveStars'],
      fourStars: json['FourStars'],
      threeStars: json['ThreeStars'],
      twoStars: json['TwoStars'],
      oneStars: json['OneStars'],
    );
  }
}
