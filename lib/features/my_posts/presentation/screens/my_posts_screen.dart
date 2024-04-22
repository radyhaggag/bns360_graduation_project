import 'package:bns360_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector_container.dart';
import '../bloc/my_posts_bloc.dart';
import '../widgets/my_posts_body.dart';
import '../widgets/my_posts_screen_app_bar.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  static Widget getWithBlocProvider() {
    return BlocProvider(
      create: (context) =>
          sl<MyPostsBloc>()..add(GetMyPostsJobsEvent()),
      child: const MyPostsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const MyPostsScreenAppBar(),
      body: const MyPostsBody(),
    );
  }
}
