import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/utils/extensions/context.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/jobs_bloc.dart';
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
          ).then((_) {
            if (context.mounted) Navigator.pop(context);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          leading: const CustomBackButton(),
        ),
        body: const AddJobBody(),
      ),
    );
  }
}
