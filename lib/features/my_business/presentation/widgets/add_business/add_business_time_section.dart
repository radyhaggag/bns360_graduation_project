import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';

class AddBusinessTimeSection extends StatelessWidget {
  const AddBusinessTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
