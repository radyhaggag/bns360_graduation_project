import 'package:bns360_graduation_project/features/my_services/presentation/bloc/my_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/enums/time.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/is_always_available_dropdown.dart';
import '../../../../../core/widgets/time_duration_dropdown.dart';
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
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            maxLength: 2,
                          ),
                        ),
                        15.horizontalSpace,
                        TimeDurationDropdown(
                          value:
                              context.read<MyServicesBloc>().fromTimeDuration,
                          onTapCallback: (value) {
                            context.read<MyServicesBloc>().add(
                                  SetTimeDurationEvent(
                                    fromTimeDuration: value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            maxLength: 2,
                          ),
                        ),
                        15.horizontalSpace,
                        TimeDurationDropdown(
                          value: context.read<MyServicesBloc>().toTimeDuration,
                          onTapCallback: (value) {
                            context.read<MyServicesBloc>().add(
                                  SetTimeDurationEvent(
                                    toTimeDuration: value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    const WorkingHoursSection(),
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

class WorkingHoursSection extends StatelessWidget {
  const WorkingHoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyServicesBloc, MyServicesState>(
      builder: (context, state) {
        return ReactiveFormConsumer(
          builder: (context, form, child) {
            final bloc = context.read<MyServicesBloc>();
            final fromHours = form.controls['from']?.value ?? "0";
            final toHours = form.controls['to']?.value ?? "0";

            final fromInt = int.parse(fromHours.toString());
            final toInt = int.parse(toHours.toString());

            final from24Format = TimeDuration.convertTo24Format(
              fromInt,
              bloc.fromTimeDuration,
            );

            final to24Format = TimeDuration.convertTo24Format(
              toInt,
              bloc.toTimeDuration,
            );

            int sum = to24Format - from24Format;

            sum = sum < 0 ? sum + 24 : sum;

            return Text(
              S.of(context).num_of_working_hours(sum),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.cardColor,
              ),
            );
          },
        );
      },
    );
  }
}
