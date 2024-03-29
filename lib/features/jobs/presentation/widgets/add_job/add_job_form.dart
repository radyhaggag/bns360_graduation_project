import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../generated/l10n.dart';
import 'job_type_radio_tile.dart';

class AddJobForm extends StatelessWidget {
  const AddJobForm({
    super.key,
    required this.form,
    this.selectedJobType,
    this.onJobTypeChanged,
  });

  final FormGroup form;
  final JobType? selectedJobType;
  final void Function(JobType?)? onJobTypeChanged;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomReactiveFormField(
            title: t.job_title,
            hint: t.enter_job_title,
            formControlName: 'title',
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.job_description,
            hint: t.enter_job_description,
            formControlName: 'description',
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.requirements,
            hint: t.enter_the_requirements,
            formControlName: 'requirements',
            maxLines: 5,
          ),
          10.verticalSpace,
          JobTypeRadioTile(
            value: selectedJobType,
            onChanged: onJobTypeChanged,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.work_hours,
            hint: "00",
            formControlName: 'workHours',
            isHorizontally: true,
            textFieldWidth: 100.w,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            separatorWidget: const Spacer(),
            textAlign: TextAlign.center,
            // textFieldHeight: 40.h,
            textStyle: context.textTheme.bodyMedium,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.salary,
            hint: "${t.egypt_currency} 00,00",
            formControlName: 'salary',
            isHorizontally: true,
            textFieldWidth: 100.w,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            separatorWidget: const Spacer(),
            textAlign: TextAlign.center,
            // textFieldHeight: 40.h,
            textStyle: context.textTheme.bodyMedium,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.phoneNumber,
            prefixText: "+20 ",
            hint: "+20 ",
            formControlName: 'phoneNumber',
            isHorizontally: true,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            textFieldWidth: .5.sw,
            // textFieldHeight: 40.h,
            textStyle: context.textTheme.bodyMedium,
            maxLength: 10,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.whatsapp,
            prefixText: "+20 ",
            hint: "+20 ",
            formControlName: 'whatsapp',
            isHorizontally: true,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            textFieldWidth: .5.sw,
            // textFieldHeight: 40.h,
            textStyle: context.textTheme.bodyMedium,
            maxLength: 10,
          ),
        ],
      ),
    );
  }
}
