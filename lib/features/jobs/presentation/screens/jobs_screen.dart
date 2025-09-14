import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/jobs_bloc.dart';
import '../widgets/jobs_screen/jobs_body.dart';
import '../widgets/jobs_screen/jobs_screen_app_bar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<JobsBloc>()..add(GetJobsEvent()),
      child: const JobsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const JobsScreenAppBar(),
      body: const JobsBody(),
    );
  }
}
