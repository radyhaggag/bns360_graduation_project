import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/screens/categories_screen.dart';
import '../../../crafts/presentation/screens/crafts_screen.dart';
import '../../../favorites/presentation/screens/favorites_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<ChangeBottomNavbarIndex>(_changeBottomNavbarIndex);
  }

  final views = [
    HomeScreen.getWithBlocProvider(),
    CategoriesScreen.getWithBlocProvider(),
    FavoritesScreen.getWithBlocProvider(),
    CraftsScreen.getWithBlocProvider(),
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
