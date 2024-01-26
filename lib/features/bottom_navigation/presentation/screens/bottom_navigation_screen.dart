import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bottom_navigation_bloc.dart';
import '../widgets/main_bottom_navigation.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

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
