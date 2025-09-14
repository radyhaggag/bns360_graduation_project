import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/screens/categories_screen.dart';
import '../../../conversations/presentation/screens/conversations_screen.dart';
import '../../../crafts/presentation/screens/crafts_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../jobs/presentation/screens/jobs_screen.dart';
import '../../../profile/presentation/screen/profile_screen.dart';
import '../../../properties/presentation/screens/properties_screen.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<ChangeBottomNavbarIndex>(_changeBottomNavbarIndex);
  }

  final views = [
    HomeScreen.getWithBlocProvider(),
    CategoriesScreen.getWithBlocProvider(),
    JobsScreen.getWithBlocProvider(),
    CraftsScreen.getWithBlocProvider(),
    PropertiesScreen.getWithBlocProvider(),
    const ConversationsScreen(), // Not on nav bar
    const ProfileScreen(), // Not on nav bar
  ];
  int bottomNavbarIndex = 0;

  Widget get currentView => views[bottomNavbarIndex];

  void _changeBottomNavbarIndex(
    ChangeBottomNavbarIndex event,
    Emitter<BottomNavBarState> emit,
  ) {
    bottomNavbarIndex = event.index;
    emit(BottomNavbarIndexChanged(bottomNavbarIndex));
  }
}
