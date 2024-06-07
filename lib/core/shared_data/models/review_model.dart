import 'package:bns360_graduation_project/core/helpers/api_images_helper.dart';

import '../entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.date,
    required super.userName,
    required super.userImage,
    required super.reviewText,
    required super.starCount,
    required super.userId,
    super.isHappy,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['Id'],
      date: json['dateTime'] ?? DateTime.now().toString(),
      userName: json['UserName'] ?? "Someone",
      userImage:
          APIImagesHelper.toServerImage(json['PhotoUrl'], addDefault: true)!,
      reviewText: json['Review'],
      starCount: json['Rating'],
      userId: json["UserId"],
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      date: entity.date,
      userName: entity.userName,
      userImage: entity.userImage,
      reviewText: entity.reviewText,
      starCount: entity.starCount,
      userId: entity.userId,
      isHappy: entity.isHappy,
    );
  }
}
