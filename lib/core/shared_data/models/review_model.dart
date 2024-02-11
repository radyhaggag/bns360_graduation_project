import '../entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.date,
    required super.userName,
    required super.userImage,
    required super.reviewText,
    required super.starCount,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      date: json['date'],
      userName: json['user_name'],
      userImage: json['user_image'],
      reviewText: json['review_text'],
      starCount: json['star_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'user_name': userName,
      'user_image': userImage,
      'review_text': reviewText,
      'star_count': starCount,
    };
  }
}
