import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/jobs_bloc.dart';
import '../widgets/jobs_body.dart';
import '../widgets/jobs_screen_app_bar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<JobsBloc>(),
      child: const JobsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).listTileTheme.tileColor,
      appBar: const JobsScreenAppBar(),
      body: const JobsBody(),
    );
  }
}
