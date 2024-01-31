import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/favorites_bloc.dart';
import '../widgets/favorites_body.dart';
import '../widgets/favorites_screen_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) =>
          sl<FavoritesBloc>()..add(GetFavoriteCategoriesEvent()),
      child: const FavoritesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).listTileTheme.tileColor,
      appBar: const FavoritesScreenAppBar(),
      body: const FavoritesBody(),
    );
  }
}
