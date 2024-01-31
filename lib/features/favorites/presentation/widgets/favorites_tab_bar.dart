import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../../generated/l10n.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesTabBar extends StatelessWidget {
  const FavoritesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      padding: const EdgeInsets.only(top: 8),
      labelStyle: TextStyle(
        color: Theme.of(context).cardColor,
        fontSize: AppFontSize.details,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        color: Theme.of(context).primaryColor.withOpacity(.38),
        fontSize: AppFontSize.details,
        fontWeight: FontWeight.w500,
      ),
      tabs: [
        Tab(text: S.of(context).categories),
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
