part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CategoriesEvent {}

class ToggleSearchIcon extends CategoriesEvent {
  final String categoryId;

  const ToggleSearchIcon({required this.categoryId});
}

class SearchOnCategoryItems extends CategoriesEvent {
  final String categoryId;

  const SearchOnCategoryItems({required this.categoryId});
}

class GetCategoryItemsByIdEvent extends CategoriesEvent {
  final String categoryId;

  const GetCategoryItemsByIdEvent({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
