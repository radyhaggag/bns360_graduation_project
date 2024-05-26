import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/data_state_widget.dart';
import '../../../../core/widgets/job_card/job_card.dart';
import '../../../../core/widgets/main_list_view_builder.dart';
import '../../../../generated/l10n.dart';
import '../bloc/saved_bloc.dart';

class SavedJobsBuilder extends StatelessWidget {
  const SavedJobsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, state) {
        final savedJobs = context.read<SavedBloc>().savedJobs;

        return DataStateWidget(
          isLoading: state is GetSavedJobsLoadingState,
          isError: state is GetSavedJobsErrorState,
          isLoaded: state is GetSavedJobsSuccessState,
          errorMessage: state is GetSavedJobsErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<JobEntity>(
            list: savedJobs,
            emptyMessage: S.of(context).no_jobs_found,
            itemWidget: (item, _) => JobCard(
              jobEntity: item,
              isInSavedScreen: true,
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
