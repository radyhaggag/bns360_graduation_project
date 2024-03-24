import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets/app_svg.dart';
import '../bloc/bottom_navigation_bloc.dart';

const _iconList = [
  AppSvg.home,
  AppSvg.categoryFilled,
  AppSvg.jobs,
  AppSvg.construction,
  AppSvg.realEstate,
];

class MainBottomNavbar extends StatelessWidget {
  const MainBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: _iconList.length,
          tabBuilder: (int index, bool isActive) {
            Color iconColor = isActive ? AppColors.primary : AppColors.white;

            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                _iconList[index],
                fit: BoxFit.scaleDown,
                color: iconColor,
                height: (index == 0 || index == 2) ? 26 : 30,
              ),
            );
          },
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          gapWidth: 0,
          activeIndex: context.read<BottomNavBarBloc>().bottomNavbarIndex,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => context.read<BottomNavBarBloc>().add(
                ChangeBottomNavbarIndex(index: index),
              ),
        );
      },
    );
  }
}
