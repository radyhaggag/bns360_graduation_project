import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../bloc/jobs_bloc.dart';

class EditJobButton extends StatelessWidget {
  const EditJobButton({
    super.key,
    required this.onEdit,
    this.isJobTypeSelected = false,
  });

  final VoidCallback onEdit;
  final bool isJobTypeSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ReactiveFormConsumer(
          builder: (context, form, child) {
            return BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                return CustomElevatedButton(
                  label: S.of(context).update,
                  onPressed: onEdit,
                  width: context.width,
                  height: 50.h,
                  isDisabled: !(form.valid && isJobTypeSelected),
                  isLoading: state is EditJobLoadingState,
                  borderRadius: BorderRadius.circular(8),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
