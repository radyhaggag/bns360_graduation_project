part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class GetFavoriteCategoriesLoadingState extends FavoritesState {}

class GetFavoriteCategoriesSuccessState extends FavoritesState {
  final List<CategoryItemEntity> favorites;

  const GetFavoriteCategoriesSuccessState({required this.favorites});
}

class GetFavoriteCategoriesErrorState extends FavoritesState {
  final String message;

  const GetFavoriteCategoriesErrorState({required this.message});
}

class GetFavoriteCraftsmenLoadingState extends FavoritesState {}

class GetFavoriteCraftsmenSuccessState extends FavoritesState {
  final List<CraftsmanEntity> favorites;

  const GetFavoriteCraftsmenSuccessState({required this.favorites});
}

class GetFavoriteCraftsmenErrorState extends FavoritesState {
  final String message;

  const GetFavoriteCraftsmenErrorState({required this.message});
}

class CurrentViewChanged extends FavoritesState {
  final int index;

  const CurrentViewChanged({required this.index});

  @override
  List<Object> get props => [index];
}

class AddCategoryItemToFavoriteLoadingState extends FavoritesState {
  final int itemId;

  const AddCategoryItemToFavoriteLoadingState({required this.itemId});
}

class AddCategoryItemToFavoriteSuccessState extends FavoritesState {
  final int itemId;

  const AddCategoryItemToFavoriteSuccessState({required this.itemId});
}

class AddCategoryItemToFavoriteErrorState extends FavoritesState {
  final String message;
  final int itemId;

  const AddCategoryItemToFavoriteErrorState({
    required this.message,
    required this.itemId,
  });
}

class RemoveCategoryItemFromFavoriteLoadingState extends FavoritesState {
  final int itemId;

  const RemoveCategoryItemFromFavoriteLoadingState({required this.itemId});
}

class RemoveCategoryItemFromFavoriteSuccessState extends FavoritesState {
  final int itemId;

  const RemoveCategoryItemFromFavoriteSuccessState({required this.itemId});
}

class RemoveCategoryItemFromFavoriteErrorState extends FavoritesState {
  final String message;
  final int itemId;

  const RemoveCategoryItemFromFavoriteErrorState({
    required this.message,
    required this.itemId,
  });
}

class AddCraftsmanToFavoriteLoadingState extends FavoritesState {
  final int itemId;

  const AddCraftsmanToFavoriteLoadingState({required this.itemId});
}

class AddCraftsmanToFavoriteSuccessState extends FavoritesState {
  final int itemId;

  const AddCraftsmanToFavoriteSuccessState({required this.itemId});
}

class AddCraftsmanToFavoriteErrorState extends FavoritesState {
  final String message;
  final int itemId;

  const AddCraftsmanToFavoriteErrorState({
    required this.message,
    required this.itemId,
  });
}

class RemoveCraftsmanFromFavoriteLoadingState extends FavoritesState {
  final int itemId;

  const RemoveCraftsmanFromFavoriteLoadingState({required this.itemId});
}

class RemoveCraftsmanFromFavoriteSuccessState extends FavoritesState {
  final int itemId;

  const RemoveCraftsmanFromFavoriteSuccessState({required this.itemId});
}

class RemoveCraftsmanFromFavoriteErrorState extends FavoritesState {
  final String message;
  final int itemId;

  const RemoveCraftsmanFromFavoriteErrorState({
    required this.message,
    required this.itemId,
  });
}
