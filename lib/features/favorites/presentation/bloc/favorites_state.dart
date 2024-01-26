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
