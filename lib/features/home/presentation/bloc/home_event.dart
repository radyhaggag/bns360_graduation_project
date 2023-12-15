part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavbarIndex extends HomeEvent {
  final int index;

  const ChangeBottomNavbarIndex({required this.index});

  @override
  List<Object> get props => [index];
}

class GetBannersEvent extends HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class GetPlacesToExploreEvent extends HomeEvent {}
