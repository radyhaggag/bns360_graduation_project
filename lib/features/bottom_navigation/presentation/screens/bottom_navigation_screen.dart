import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/permissions/main_permissions_helper.dart';
import '../../../favorites/presentation/bloc/favorites_bloc.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../saved_items/presentation/bloc/saved_bloc.dart';
import '../bloc/bottom_navigation_bloc.dart';
import '../widgets/main_bottom_navigation.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  void initState() {
    super.initState();
    if (!AppProvider().isGuest) {
      _fetchData();
    }
    MainPermissionHandler().requestLocationPermission(context);
  }

  _fetchData() {
    context.read<FavoritesBloc>()
      ..add(GetFavoriteCategoriesEvent(skipPreviousCheck: true))
      ..add(GetFavoriteCraftsmenEvent(skipPreviousCheck: true));

    context.read<SavedBloc>()
      ..add(GetSavedJobsEvent(skipPreviousCheck: true))
      ..add(GetSavedPropertiesEvent(skipPreviousCheck: true));

    context.read<ProfileBloc>().add(const GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          final currentScreen = context.read<BottomNavBarBloc>().currentView;
          return currentScreen;
        },
      ),
      bottomNavigationBar: const MainBottomNavbar(),
    );
  }
}
