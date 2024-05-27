import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/my_posts_body.dart';
import '../widgets/my_posts_screen_app_bar.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: const MyPostsScreenAppBar(),
      body: const MyPostsBody(),
    );
  }
}
