import 'package:bns360_graduation_project/core/utils/extensions/price.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import '../edit_requirements_section/edit_requirements_section.dart';
import '../job_type_radio_tile.dart';

class EditJobForm extends StatelessWidget {
  const EditJobForm({
    super.key,
    required this.form,
    required this.jobEntity,
    this.selectedJobType,
    this.onJobTypeChanged,
  });

  final FormGroup form;
  final JobType? selectedJobType;
  final void Function(JobType?)? onJobTypeChanged;
  final JobEntity jobEntity;

  void _onAddRequirement(
    BuildContext context, {
    required String requirement,
  }) {
    context.read<JobsBloc>().add(
          AddRequirementEvent(
            requirement: requirement,
            context: context,
            withTranslation: true,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomReactiveFormField(
            title: "${t.job_title}\t(${t.in_arabic})",
            hint: "${t.enter_job_title}\t(${t.in_arabic})",
            formControlName: 'title_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.job_title}\t(${t.in_english})",
            hint: "${t.enter_job_title}\t(${t.in_english})",
            formControlName: 'title_eng',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.job_description}\t(${t.in_arabic})",
            hint: "${t.enter_job_description}\t(${t.in_arabic})",
            formControlName: 'description_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.job_description}\t(${t.in_english})",
            hint: "${t.enter_job_description}\t(${t.in_english})",
            formControlName: 'description_eng',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          EditRequirementsSection(
            onAdd: (value) => _onAddRequirement(
              context,
              requirement: value,
            ),
          ),
          10.verticalSpace,
          const WhatsappAndMobileFields(),
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
            textStyle: context.textTheme.bodyMedium,
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.salary,
            hint: 00.toPrice(context),
            formControlName: 'salary',
            isHorizontally: true,
            textFieldWidth: 100.w,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            separatorWidget: const Spacer(),
            textAlign: TextAlign.center,
            textStyle: context.textTheme.bodyMedium,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
