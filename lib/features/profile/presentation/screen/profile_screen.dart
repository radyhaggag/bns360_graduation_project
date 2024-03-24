import 'package:bns360_graduation_project/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../widgets/profile/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetProfileEvent()),
      child: const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppColors.primary,
      body: SafeArea(
        child: ProfileBody(),
      ),
    );
  }
}
