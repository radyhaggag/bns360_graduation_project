part of 'categories_bloc.dart';

abstract class CategoriesState  {
  const CategoriesState();

}

class CategoriesInitial extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}

class GetCategoriesSuccessState extends CategoriesState {
  final List<CategoryEntity> categories;

  const GetCategoriesSuccessState({required this.categories});
}

class GetCategoriesErrorState extends CategoriesState {
  final String message;

  const GetCategoriesErrorState({required this.message});
}

class SearchIconToggled extends CategoriesState {
  final bool isSearchEnabled;

  const SearchIconToggled({required this.isSearchEnabled});

}

class GetCategoryItemsLoadingState extends CategoriesState {}

class GetCategoryItemsSuccessState extends CategoriesState {
  final List<CategoryItemInfoEntity> items;

  const GetCategoryItemsSuccessState({required this.items});
}

class GetCategoryItemsErrorState extends CategoriesState {
  final String message;

  const GetCategoryItemsErrorState({required this.message});
}
