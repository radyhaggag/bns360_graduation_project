import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/features/my_posts/presentation/widgets/more_section/more_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/job_card/job_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_posts_bloc.dart';

class MyPostsJobsBuilder extends StatelessWidget {
  const MyPostsJobsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostsBloc, MyPostsState>(
      buildWhen: (previous, current) {
        final states = [
          GetMyPostsJobsLoadingState,
          GetMyPostsJobsErrorState,
          GetMyPostsJobsSuccessState,
          PostsUpdatedState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final myPostsJobs = context.read<MyPostsBloc>().myPostsJobs;

        return DataStateWidget(
          isLoading: state is GetMyPostsJobsLoadingState,
          isError: state is GetMyPostsJobsErrorState,
          isLoaded: state is GetMyPostsJobsSuccessState,
          errorMessage: state is GetMyPostsJobsErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<JobEntity>(
            list: myPostsJobs,
            emptyMessage: S.of(context).no_jobs_found,
            itemWidget: (item, index) => JobCard(
              jobEntity: item,
              moreWidget: MoreIcon(
                onDelete: () {
                  context.read<MyPostsBloc>().add(
                        DeletePostEvent(isJob: true, index: index),
                      );
                },
                onEdit: () {
                  Navigator.of(context).pushNamed(
                    Routes.addJob,
                    arguments: item,
                  );
                },
              ),
            ),
            scrollDirection: Axis.vertical,
            width: context.width,
            height: context.height,
          ),
        );
      },
    );
  }
}
