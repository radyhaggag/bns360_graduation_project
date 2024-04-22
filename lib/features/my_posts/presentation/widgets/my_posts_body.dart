import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_posts_bloc.dart';
import 'my_posts_jobs_builder.dart';
import 'my_posts_properties_builder.dart';
import 'my_posts_tab_bar.dart';

class MyPostsBody extends StatelessWidget {
  const MyPostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const MyPostsTabBar(),
          const SizedBox(height: 9),
          Expanded(
            child: BlocBuilder<MyPostsBloc, MyPostsState>(
              builder: (context, state) {
                final activeTabIndex =
                    context.read<MyPostsBloc>().activeTabIndex;
                if (activeTabIndex == 1) {
                  return const MyPostsJobsBuilder();
                }
                if (activeTabIndex == 0) {
                  return const MyPostsPropertiesBuilder();
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
