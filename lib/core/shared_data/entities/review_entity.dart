import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int id;
  final String date;
  final String userName;
  final String userImage;
  final String reviewText;
  final num starCount;

  const ReviewEntity({
    required this.id,
    required this.date,
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.starCount,
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
}
