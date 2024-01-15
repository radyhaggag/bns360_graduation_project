import '../bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/main_bottom_navbar.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

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
