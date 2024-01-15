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
    return const Scaffold(
      appBar: HomeScreenAppBar(),
      body: HomeBody(),
    );
  }
}
