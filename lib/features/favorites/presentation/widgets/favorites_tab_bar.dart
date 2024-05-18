import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../generated/l10n.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesTabBar extends StatelessWidget {
  const FavoritesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      padding: const EdgeInsets.only(top: 8),
      indicatorColor: AppColors.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        color: context.theme.cardColor,
        fontSize: AppFontSize.details,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        color: context.theme.primaryColor.withOpacity(.38),
        fontSize: AppFontSize.details,
        fontWeight: FontWeight.w600,
      ),
      tabs: [
        Tab(text: S.of(context).places),
        Tab(text: S.of(context).craftsmen),
      ],
      onTap: (index) {
        context.read<FavoritesBloc>().add(ChangeCurrentView(
              index: index,
            ));
      },
    );
  }
}
