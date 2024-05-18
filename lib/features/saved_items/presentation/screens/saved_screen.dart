import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/saved_bloc.dart';
import '../widgets/saved_body.dart';
import '../widgets/saved_screen_app_bar.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) =>
          sl<SavedBloc>()..add(GetSavedJobsEvent()),
      child: const SavedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const SavedScreenAppBar(),
      body: const SavedBody(),
    );
  }
}
