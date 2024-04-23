import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/my_services_bloc.dart';

class SubmitServiceButton extends StatelessWidget {
  const SubmitServiceButton({
    super.key,
    required this.onAdd,
    required this.isUpdate,
  });

  final VoidCallback onAdd;
  final bool isUpdate;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return BlocBuilder<MyServicesBloc, MyServicesState>(
          builder: (context, state) {
            return CustomElevatedButton(
              label:isUpdate? S.of(context).update: S.of(context).add_service,
              onPressed: (form.valid) ? onAdd : null,
              isLoading: state is AddServiceLoadingState||state is UpdateServiceLoadingState,
              width: context.width,
              height: 50.h,
              borderRadius: BorderRadius.circular(8),
            );
          },
        );
      },
    );
  }
}
