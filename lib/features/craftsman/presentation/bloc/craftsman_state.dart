part of 'craftsman_bloc.dart';

abstract class CraftsmanState {
  const CraftsmanState();
}

class CraftsmanInitial extends CraftsmanState {}

class GetCraftsmanReviewSummaryLoadingState extends CraftsmanState {}

class GetCraftsmanReviewSummarySuccessState extends CraftsmanState {
  final ReviewSummaryEntity summary;

  const GetCraftsmanReviewSummarySuccessState({required this.summary});
}

class GetCraftsmanReviewSummaryErrorState extends CraftsmanState {
  final String message;

  const GetCraftsmanReviewSummaryErrorState({required this.message});
}

class GetCraftsmanReviewsLoadingState extends CraftsmanState {}

class GetCraftsmanReviewsSuccessState extends CraftsmanState {
  final List<ReviewEntity> reviews;

  const GetCraftsmanReviewsSuccessState({required this.reviews});
}

class GetCraftsmanReviewsErrorState extends CraftsmanState {
  final String message;

  const GetCraftsmanReviewsErrorState({required this.message});
}

class GetCraftsmanLoadingState extends CraftsmanState {}

class GetCraftsmanSuccessState extends CraftsmanState {
  final CraftsmanEntity craftsmanEntity;

  const GetCraftsmanSuccessState({required this.craftsmanEntity});
}

class GetCraftsmanErrorState extends CraftsmanState {
  final String message;

  const GetCraftsmanErrorState({required this.message});
}

class SendCraftsmanReviewLoadingState extends CraftsmanState {}

class SendCraftsmanReviewSuccessState extends CraftsmanState {}

class SendCraftsmanReviewErrorState extends CraftsmanState {
  final String message;

  final String review;
  final double rating;

  const SendCraftsmanReviewErrorState({
    required this.message,
    required this.review,
    required this.rating,
  });
}

class RemoveCraftsmanReviewLoadingState extends CraftsmanState {
  final int reviewId;

  const RemoveCraftsmanReviewLoadingState({
    required this.reviewId,
  });
}

class RemoveCraftsmanReviewSuccessState extends CraftsmanState {}

class RemoveCraftsmanReviewErrorState extends CraftsmanState {
  final String message;

  const RemoveCraftsmanReviewErrorState({required this.message});
}
