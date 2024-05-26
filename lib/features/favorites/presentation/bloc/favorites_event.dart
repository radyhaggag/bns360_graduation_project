part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteCategoriesEvent extends FavoritesEvent {}

class GetFavoriteCraftsmenEvent extends FavoritesEvent {}

class ChangeCurrentView extends FavoritesEvent {
  final int index;

  const ChangeCurrentView({required this.index});

  @override
  List<Object> get props => [index];
}

class AddCategoryItemToFavorite extends FavoritesEvent {
  final int itemId;

  const AddCategoryItemToFavorite({required this.itemId});

  @override
  List<Object> get props => [itemId];
}

class RemoveCategoryItemFromFavorite extends FavoritesEvent {
  final int itemId;

  const RemoveCategoryItemFromFavorite({required this.itemId});

  @override
  List<Object> get props => [itemId];
}

class AddCraftsmanToFavorite extends FavoritesEvent {
  final int itemId;

  const AddCraftsmanToFavorite({required this.itemId});

  @override
  List<Object> get props => [itemId];
}

class RemoveCraftsmanFromFavorite extends FavoritesEvent {
  final int itemId;

  const RemoveCraftsmanFromFavorite({required this.itemId});

  @override
  List<Object> get props => [itemId];
}
