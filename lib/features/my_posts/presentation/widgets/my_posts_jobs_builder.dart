import 'package:bns360_graduation_project/core/widgets/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/job_card/job_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../core/widgets/more_icon.dart';
import '../../../../generated/l10n.dart';
import '../bloc/my_posts_bloc.dart';

class MyPostsJobsBuilder extends StatelessWidget {
  const MyPostsJobsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostsBloc, MyPostsState>(
      builder: (context, state) {
        final myPostsJobs = context.read<MyPostsBloc>().myPostsJobs;
        

        return DataStateWidget(
          isLoading: state is GetMyPostsJobsLoadingState || state is DeletePostLoadingState,
          isError: state is GetMyPostsJobsErrorState,
          isLoaded: state is GetMyPostsJobsSuccessState,
          errorMessage: state is GetMyPostsJobsErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<JobEntity>(
            list: myPostsJobs,
            emptyWidget: Center(
              child: EmptyCard(
                title: S.of(context).no_jobs_found,
              ),
            ),
            itemWidget: (item, index) => JobCard(
              jobEntity: item.copyWith(isBelongToMe: true),
              moreWidget: MoreIcon(
                onDelete: () {
                  context.read<MyPostsBloc>().add(
                        DeletePostEvent(
                          isJob: true,
                          index: index,
                          itemId: item.id,
                        ),
                      );
                },
                onEdit: () async {
                  await Navigator.of(context).pushNamed(
                    Routes.editJob,
                    arguments: item,
                  );

                  if (!context.mounted) return;

                  context.read<MyPostsBloc>().add(GetMyPostsJobsEvent());
                },
                deleteMessage: S.of(context).delete_post,
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
