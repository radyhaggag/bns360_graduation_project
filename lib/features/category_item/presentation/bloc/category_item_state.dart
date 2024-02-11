part of 'category_item_bloc.dart';

abstract class CategoryItemState extends Equatable {
  const CategoryItemState();

  @override
  List<Object> get props => [];
}

class CategoryItemInitial extends CategoryItemState {}

class GetCategoryItemReviewsLoadingState extends CategoryItemState {}

class GetCategoryItemReviewsSuccessState extends CategoryItemState {
  final List<ReviewEntity> reviews;

  const GetCategoryItemReviewsSuccessState({required this.reviews});
}

class GetCategoryItemReviewsErrorState extends CategoryItemState {
  final String message;

  const GetCategoryItemReviewsErrorState({required this.message});
}
