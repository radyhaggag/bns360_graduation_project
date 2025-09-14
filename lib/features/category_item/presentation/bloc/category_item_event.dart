part of 'category_item_bloc.dart';

abstract class CategoryItemEvent extends Equatable {
  const CategoryItemEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryItemReviewsEvent extends CategoryItemEvent {
  final int itemId;

  const GetCategoryItemReviewsEvent({required this.itemId});
}

class GetCategoryItemReviewSummaryEvent extends CategoryItemEvent {
  final int itemId;

  const GetCategoryItemReviewSummaryEvent({required this.itemId});
}

class GetCategoryItemEvent extends CategoryItemEvent {
  final int itemId;

  const GetCategoryItemEvent({required this.itemId});
}

class SetCategoryItemEntityEvent extends CategoryItemEvent {
  final CategoryItemEntity categoryItemEntity;

  const SetCategoryItemEntityEvent({required this.categoryItemEntity});
}

class SendReviewEvent extends CategoryItemEvent {
  final int itemId;
  final double rating;
  final String review;
  final bool fetchReviews;

  const SendReviewEvent({
    required this.itemId,
    required this.rating,
    required this.review,
    required this.fetchReviews,
  });
}

class RemoveCategoryItemReviewEvent extends CategoryItemEvent {
  final int reviewId;
  final int categoryItemId;

  const RemoveCategoryItemReviewEvent({
    required this.reviewId,
    required this.categoryItemId,
  });
}
