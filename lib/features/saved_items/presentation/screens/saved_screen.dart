import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/saved_bloc.dart';
import '../widgets/saved_body.dart';
import '../widgets/saved_screen_app_bar.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<SavedBloc>().add(GetSavedJobsEvent());
    context
        .read<SavedBloc>()
        .add(GetSavedPropertiesEvent(skipPreviousCheck: true));
  }

  @override
  void deactivate() {
    context.read<SavedBloc>().activeTabIndex = 0;
    super.deactivate();
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
