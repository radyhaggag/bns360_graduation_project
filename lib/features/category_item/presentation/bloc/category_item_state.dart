part of 'category_item_bloc.dart';

abstract class CategoryItemState extends Equatable {
  const CategoryItemState();

  @override
  List<Object> get props => [];
}

class CategoryItemInitial extends CategoryItemState {}

class GetCategoryItemReviewSummaryLoadingState extends CategoryItemState {}

class GetCategoryItemReviewSummarySuccessState extends CategoryItemState {
  final ReviewSummaryEntity summary;

  const GetCategoryItemReviewSummarySuccessState({required this.summary});
}

class GetCategoryItemReviewSummaryErrorState extends CategoryItemState {
  final String message;

  const GetCategoryItemReviewSummaryErrorState({required this.message});
}

class GetCategoryItemReviewsLoadingState extends CategoryItemState {}

class GetCategoryItemReviewsSuccessState extends CategoryItemState {
  final List<ReviewEntity> reviews;

  const GetCategoryItemReviewsSuccessState({required this.reviews});
}

class GetCategoryItemReviewsErrorState extends CategoryItemState {
  final String message;

  const GetCategoryItemReviewsErrorState({required this.message});
}

class GetCategoryItemLoadingState extends CategoryItemState {}

class GetCategoryItemSuccessState extends CategoryItemState {
  final CategoryItemEntity categoryItem;

  const GetCategoryItemSuccessState({required this.categoryItem});
}

class GetCategoryItemErrorState extends CategoryItemState {
  final String message;

  const GetCategoryItemErrorState({required this.message});
}

class SendCategoryItemReviewLoadingState extends CategoryItemState {}

class SendCategoryItemReviewSuccessState extends CategoryItemState {}

class SendCategoryItemReviewErrorState extends CategoryItemState {
  final String message;

  final String review;
  final double rating;

  const SendCategoryItemReviewErrorState({
    required this.message,
    required this.review,
    required this.rating,
  });
}

class RemoveCategoryItemReviewLoadingState extends CategoryItemState {}

class RemoveCategoryItemReviewSuccessState extends CategoryItemState {}

class RemoveCategoryItemReviewErrorState extends CategoryItemState {
  final String message;

  const RemoveCategoryItemReviewErrorState({required this.message});
}