import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';

class AddJobButton extends StatelessWidget {
  const AddJobButton({
    super.key,
    required this.onAdd,
    this.isJobTypeSelected = false,
  });

  final VoidCallback onAdd;
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
                  label: S.of(context).post_now,
                  onPressed: onAdd,
                  width: context.width,
                  height: 50.h,
                  isDisabled: !(form.valid && isJobTypeSelected),
                  isLoading: state is AddJobLoadingState,
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
