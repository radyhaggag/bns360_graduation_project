part of 'bottom_navigation_bloc.dart';

abstract class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  @override
  List<Object> get props => [];
}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavbarIndexChanged extends BottomNavBarState {
  final int index;

  const BottomNavbarIndexChanged(this.index);

  @override
  List<Object> get props => [index];
}
