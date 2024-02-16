import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/permissions/main_permissions_helper.dart';
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
    MainPermissionHandler().requestLocationPermission(context);
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
