import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/properties_bloc.dart';

class EditPropertyButton extends StatelessWidget {
  const EditPropertyButton({
    super.key,
    required this.onEdit,
    this.isOfferTypeSelected = false,
  });

  final VoidCallback onEdit;
  final bool isOfferTypeSelected;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        final images = context.read<PropertiesBloc>().pickedImages;
        return BlocBuilder<PropertiesBloc, PropertiesState>(
          builder: (context, state) {
            return CustomElevatedButton(
              label: S.of(context).update,
              onPressed: onEdit,
              isDisabled:
                  !(form.valid && isOfferTypeSelected) || images.isEmpty,
              isLoading: state is EditPropertyLoadingState,
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
