import 'package:bns360_graduation_project/config/injector_container.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return const Placeholder();
  }
}
