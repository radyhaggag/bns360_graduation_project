import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/saved_bloc.dart';
import 'saved_jobs_builder.dart';
import 'saved_properties_builder.dart';
import 'saved_tab_bar.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SavedTabBar(),
          const SizedBox(height: 9),
          Expanded(
            child: BlocBuilder<SavedBloc, SavedState>(
              builder: (context, state) {
                final activeTabIndex =
                    context.read<SavedBloc>().activeTabIndex;
                if (activeTabIndex == 1) {
                  return const SavedJobsBuilder();
                }
                if (activeTabIndex == 0) {
                  return const SavedPropertiesBuilder();
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
