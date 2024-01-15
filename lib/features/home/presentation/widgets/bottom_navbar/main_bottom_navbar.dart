import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../bloc/home_bloc.dart';

const _iconList = [
  Icons.home,
  Icons.category,
  Icons.favorite,
  Icons.message,
  Icons.notifications,
];

class MainBottomNavbar extends StatelessWidget {
  const MainBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: _iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _iconList[index],
                color: isActive
                    ? AppColors.primary
                    : AppColors.white.withOpacity(.8),
              ),
            );
          },
          backgroundColor: AppColors.primary,
          // gapLocation: GapLocation.center,
          // borderWidth: 10,
          gapWidth: 0,
          activeIndex: context.read<HomeBloc>().bottomNavbarIndex,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => context.read<HomeBloc>().add(
                ChangeBottomNavbarIndex(index: index),
              ),
        );
      },
    );
  }
}
