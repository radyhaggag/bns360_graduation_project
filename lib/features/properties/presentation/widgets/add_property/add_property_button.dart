import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:bns360_graduation_project/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPropertyButton extends StatelessWidget {
  const AddPropertyButton({
    super.key,
    required this.onAdd,
    this.isOfferTypeSelected = false,
  });

  final VoidCallback onAdd;
  final bool isOfferTypeSelected;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return BlocBuilder<PropertiesBloc, PropertiesState>(
          builder: (context, state) {
            final pickedImages = context.read<PropertiesBloc>().pickedImages;
            return CustomElevatedButton(
              label: S.of(context).post_now,
              isDisabled: pickedImages.isEmpty ||
                  !(form.valid && isOfferTypeSelected),
              onPressed: onAdd,
              isLoading: state is AddPropertyLoadingState,
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
