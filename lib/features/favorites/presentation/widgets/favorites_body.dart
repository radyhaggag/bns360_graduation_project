import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../bloc/favorites_bloc.dart';
import 'favorite_categories_builder.dart';
import 'favorite_craftsmen_builder.dart';
import 'favorites_tab_bar.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const FavoritesTabBar(),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  final activeTabIndex =
                      context.read<FavoritesBloc>().activeTabIndex;
                  if (activeTabIndex == 0) {
                    return const FavoriteCategoriesBuilder();
                  }
                  if (activeTabIndex == 1) {
                    return const FavoriteCraftsmenBuilder();
                  }
                  return Container();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
