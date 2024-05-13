import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/shared_data/entities/job_entity.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/jobs_bloc.dart';
import '../widgets/edit_job/edit_job_body.dart';

class EditJobScreen extends StatelessWidget {
  const EditJobScreen({super.key, required this.jobEntity});

  final JobEntity jobEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobsBloc, JobsState>(
      listener: (context, state) {
        if (state is EditJobErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is EditJobSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_job_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: const CustomBackButton(),
        ),
        body: EditJobBody(jobEntity: jobEntity),
      ),
    );
  }
}
