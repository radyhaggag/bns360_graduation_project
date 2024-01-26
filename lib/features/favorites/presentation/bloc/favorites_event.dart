part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteCategoriesEvent extends FavoritesEvent {}

class GetFavoriteCraftsmenEvent extends FavoritesEvent {}
