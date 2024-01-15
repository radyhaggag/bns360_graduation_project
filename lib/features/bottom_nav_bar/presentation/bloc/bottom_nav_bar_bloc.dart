import 'package:bloc/bloc.dart';
import '../../../home/presentation/screens/home_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<ChangeBottomNavbarIndex>(_changeBottomNavbarIndex);
  }

  final views = [
    HomeScreen.getWithBlocProvider(),
    const Center(
      child: Text('Categories'),
    ),
    const Center(
      child: Text('Favorites'),
    ),
    const Center(
      child: Text('Crafts'),
    ),
    const Center(
      child: Text('Settings'),
    ),
  ];
  int bottomNavbarIndex = 0;

  Widget get currentView => views[bottomNavbarIndex];

  _changeBottomNavbarIndex(
    ChangeBottomNavbarIndex event,
    Emitter<BottomNavBarState> emit,
  ) {
    bottomNavbarIndex = event.index;
    emit(BottomNavbarIndexChanged(bottomNavbarIndex));
  }
}
