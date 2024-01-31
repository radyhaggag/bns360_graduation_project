import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/categories_bloc.dart';
import '../widgets/categories_body.dart';
import '../widgets/categories_screen_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: const CategoriesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CategoriesScreenAppBar(),
      body: CategoriesBody(),
    );
  }
}
