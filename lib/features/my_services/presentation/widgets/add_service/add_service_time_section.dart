import 'package:bns360_graduation_project/features/my_services/presentation/bloc/my_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/is_always_available_dropdown.dart';
import '../../../../../generated/l10n.dart';

class AddServiceTimeSection extends StatelessWidget {
  const AddServiceTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        final isAlwaysAvailable =
            context.read<MyServicesBloc>().isAlwaysWorking;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IsAlwaysAvailableDropdown(
              isAlwaysAvailable: isAlwaysAvailable,
              onChanged: (value) {
                context.read<MyServicesBloc>().add(
                      SetIsAlwaysAvailableValueEvent(isAlwaysAvailable: value),
                    );
              },
            ),
            if (!isAlwaysAvailable) ...[
              15.verticalSpace,
              Text(
                S.of(context).work_time,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.cardColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomReactiveFormField(
                        title: S.of(context).from,
                        hint: S.of(context).from,
                        formControlName: 'from',
                        isHorizontally: true,
                        textFieldWidth: 90.w,
                        keyboardType: TextInputType.number,
                        isDigitsOnly: true,
                        textAlign: TextAlign.center,
                        textStyle: context.textTheme.bodyMedium,
                        textInputAction: TextInputAction.next,
                        isExpanded: false,
                      ),
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: CustomReactiveFormField(
                        title: S.of(context).to,
                        hint: S.of(context).to,
                        formControlName: 'to',
                        isHorizontally: true,
                        textFieldWidth: 90.w,
                        keyboardType: TextInputType.number,
                        isDigitsOnly: true,
                        textAlign: TextAlign.center,
                        textStyle: context.textTheme.bodyMedium,
                        textInputAction: TextInputAction.next,
                        isExpanded: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
