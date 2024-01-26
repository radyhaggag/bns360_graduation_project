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
