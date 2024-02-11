part of 'category_item_bloc.dart';

abstract class CategoryItemEvent extends Equatable {
  const CategoryItemEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryItemReviewsEvent extends CategoryItemEvent {
  final String itemId;

  const GetCategoryItemReviewsEvent({required this.itemId});
}
