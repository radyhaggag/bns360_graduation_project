import 'package:bns360_graduation_project/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/favorites_body.dart';
import '../widgets/favorites_screen_app_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesBloc>().add(GetFavoriteCategoriesEvent(
          skipPreviousCheck: true,
        ));
  }

  @override
  void deactivate() {
    context.read<FavoritesBloc>().activeTabIndex = 0;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const FavoritesScreenAppBar(),
      body: const FavoritesBody(),
    );
  }
}
