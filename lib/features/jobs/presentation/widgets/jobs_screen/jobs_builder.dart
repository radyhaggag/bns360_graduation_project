import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/data_state_widget.dart';
import '../../../../../core/widgets/job_card/job_card.dart';
import '../../../../../core/widgets/main_list_view_builder.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';

class JobsBuilder extends StatelessWidget {
  const JobsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      buildWhen: (previous, current) {
        final states = [
          GetJobsLoadingState,
          GetJobsErrorState,
          GetJobsSuccessState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        final jobsBloc = context.read<JobsBloc>();

        return DataStateWidget(
          isLoading: state is GetJobsLoadingState,
          isError: state is GetJobsErrorState,
          isLoaded: state is GetJobsSuccessState,
          errorMessage: state is GetJobsErrorState ? state.message : "",
          loadedWidget: MainListViewBuilder<JobEntity>(
            list: jobsBloc.items,
            emptyMessage: S.of(context).no_jobs_found,
            itemWidget: (item, _) => JobCard(jobEntity: item),
            scrollDirection: Axis.vertical,
            width: context.width,
            height: context.height,
          ),
        );
      },
    );
  }
}
