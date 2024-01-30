import 'package:bns360_graduation_project/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/settings_body.dart';
import '../widgets/settings_search_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<SettingsBloc>(),
      child: const SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: SettingsScreenAppBar(),
      body: SettingsBody(),
    );
  }
}
