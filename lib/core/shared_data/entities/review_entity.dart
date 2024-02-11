import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String date;
  final String userName;
  final String userImage;
  final String reviewText;
  final int starCount;

  const ReviewEntity({
    required this.date,
    required this.userName,
    required this.userImage,
    required this.reviewText,
    required this.starCount,
  });

  @override
  List<Object?> get props => [date, userName, userImage, reviewText, starCount];
}
