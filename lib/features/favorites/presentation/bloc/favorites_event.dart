part of 'favorites_bloc.dart';

abstract class FavoritesEvent {}

class GetFavoriteCategoriesEvent extends FavoritesEvent {
  final bool skipPreviousCheck;

  GetFavoriteCategoriesEvent({required this.skipPreviousCheck});
}

class GetFavoriteCraftsmenEvent extends FavoritesEvent {
  final bool skipPreviousCheck;

  GetFavoriteCraftsmenEvent({required this.skipPreviousCheck});
}

class ChangeCurrentView extends FavoritesEvent {
  final int index;

  ChangeCurrentView({required this.index});
}

class AddCategoryItemToFavorite extends FavoritesEvent {
  final int itemId;

  AddCategoryItemToFavorite({required this.itemId});
}

class RemoveCategoryItemFromFavorite extends FavoritesEvent {
  final int itemId;

  RemoveCategoryItemFromFavorite({required this.itemId});
}

class AddCraftsmanToFavorite extends FavoritesEvent {
  final int itemId;

  AddCraftsmanToFavorite({required this.itemId});
}

class RemoveCraftsmanFromFavorite extends FavoritesEvent {
  final int itemId;

  RemoveCraftsmanFromFavorite({required this.itemId});
}
