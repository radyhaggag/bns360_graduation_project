import 'package:bns360_graduation_project/core/helpers/common_dialogs.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/add_job/add_job_app_bar.dart';
import '../widgets/add_job/add_job_body.dart';

class AddJobScreen extends StatelessWidget {
  const AddJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobsBloc, JobsState>(
      listener: (context, state) {
        if (state is AddJobErrorState) {
          CommonDialogs.showErrorDialog(context, message: state.message);
        }
        if (state is AddJobSuccessState) {
          CommonDialogs.showSuccessDialog(
            context,
            message: S.of(context).add_job_success,
          ).then((_) => Navigator.pop(context));
        }
      },
      child: const Scaffold(
        appBar: AddJobScreenAppBar(),
        body: AddJobBody(),
      ),
    );
  }
}
