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
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      date: json['date'] ?? DateTime.now().toString(),
      userName: json['user_name'] ?? "Someone",
      userImage:
          APIImagesHelper.toServerImage(json['user_image'], addDefault: true)!,
      reviewText: json['review'],
      starCount: json['rating'],
    );
  }
}
