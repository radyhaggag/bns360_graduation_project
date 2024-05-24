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
      totalReviews: json['totalReviews'],
      averageRating: json['averageRating'],
      fiveStars: json['fiveStars'],
      fourStars: json['fourStars'],
      threeStars: json['threeStars'],
      twoStars: json['twoStars'],
      oneStars: json['oneStars'],
    );
  }
}
