// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  final bool? isHappy;

  const ReviewEntity({
    required this.id,
    required this.date,
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.starCount,
    required this.userId,
    this.isHappy,
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

  ReviewEntity copyWith({
    int? id,
    String? date,
    String? userName,
    String? userImage,
    String? reviewText,
    num? starCount,
    String? userId,
    bool? isHappy,
  }) {
    return ReviewEntity(
      id: id ?? this.id,
      date: date ?? this.date,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      reviewText: reviewText ?? this.reviewText,
      starCount: starCount ?? this.starCount,
      userId: userId ?? this.userId,
      isHappy: isHappy ?? this.isHappy,
    );
  }
}
