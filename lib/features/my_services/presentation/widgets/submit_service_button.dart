import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/utils/extensions/media_query.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../generated/l10n.dart';
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
            // final pickedImages = context.read<MyServicesBloc>().pickedImages;
            // final networkImages = context.read<MyServicesBloc>().networkImages;

            // bool isImagesNotEmpty =
            //     pickedImages.isNotEmpty || networkImages.isNotEmpty;
            final pickedImages = context.read<MyServicesBloc>().pickedImages;
            final mainImage = context.read<MyServicesBloc>().mainServiceImage;

            bool isImagesNotEmpty =
                pickedImages.isNotEmpty && mainImage != null;

            return CustomElevatedButton(
              label:
                  isUpdate ? S.of(context).update : S.of(context).add_service,
              onPressed: (form.valid && isImagesNotEmpty) ? onAdd : null,
              isLoading: state is AddServiceLoadingState ||
                  state is UpdateServiceLoadingState,
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
