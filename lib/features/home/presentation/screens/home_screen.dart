import 'package:bns360_graduation_project/config/app_config.dart';
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/features/home/presentation/widgets/floating_action_button/home_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_body.dart';
import '../widgets/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetPlacesToExploreEvent()),
      child: const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: const HomeBody(),
      floatingActionButton: (AppConfig().isProd || AppProvider().isGuest)
          ? null
          : const HomeFloatingActionButton(),
    );
  }
}
