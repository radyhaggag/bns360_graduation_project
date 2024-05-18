import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/price.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';
import '../job_type_radio_tile.dart';
import 'add_requirements_section.dart';

class AddJobForm extends StatelessWidget {
  const AddJobForm({
    super.key,
    required this.form,
    this.selectedJobType,
    this.onJobTypeChanged,
    this.jobEntity,
  });

  final FormGroup form;
  final JobType? selectedJobType;
  final void Function(JobType?)? onJobTypeChanged;
  final JobEntity? jobEntity;

  void _onAddRequirement(
    BuildContext context, {
    required String requirement,
  }) {
    context.read<JobsBloc>().add(
          AddRequirementEvent(
            requirement: requirement,
            context: context,
            withTranslation: false,
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
            title: t.job_title,
            hint: t.enter_job_title,
            formControlName: 'title',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.job_description,
            hint: t.enter_job_description,
            formControlName: 'description',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          AddRequirementsSection(
            onAdd: (value) => _onAddRequirement(context, requirement: value),
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
