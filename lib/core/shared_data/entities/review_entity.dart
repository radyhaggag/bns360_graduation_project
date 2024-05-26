import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int id;
  final String date;
  final String userName;
  final String userImage;
  final String reviewText;
  final num starCount;
  final String userId;

  const ReviewEntity({
    required this.id,
    required this.date,
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.starCount,
    required this.userId,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        userName,
        userImage,
        reviewText,
        starCount,
      ];

  bool get isByMe {
    return AppProvider().getProfile()?.id == userId;
  }
}
