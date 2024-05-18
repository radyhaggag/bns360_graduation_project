import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/helpers/validators/form_validators.dart';
import '../../../../../core/shared_data/entities/job_entity.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/strings.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/jobs_bloc.dart';
import 'edit_job_button.dart';
import 'edit_job_form.dart';

class EditJobBody extends StatefulWidget {
  const EditJobBody({
    super.key,
    required this.jobEntity,
  });

  final JobEntity jobEntity;

  @override
  State<EditJobBody> createState() => _EditJobBodyState();
}

class _EditJobBodyState extends State<EditJobBody> {
  JobType? selectedJobType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    selectedJobType = widget.jobEntity.type;
    context.read<JobsBloc>().add(
          InitJobRequirementsEvent(
            requirementsEng: widget.jobEntity.requirementEnglish.requirements,
            requirementsAr: widget.jobEntity.requirementsArabic.requirements,
          ),
        );

    form = FormGroup({
      'title_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.jobEntity.jobTitleArabic,
      ),
      'title_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.jobEntity.jobTitleEnglish,
      ),
      'description_ar': FormControl<String>(
        value: widget.jobEntity.jobDescriptionArabic,
      ),
      'description_eng': FormControl<String>(
        value: widget.jobEntity.jobDescriptionEnglish,
      ),
      'workHours': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.jobEntity.workHours.toString(),
      ),
      'salary': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.jobEntity.salary.toInt().toString(),
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.jobEntity.contacts?.phoneNumber?.withoutCountryCode,
      ),
      'whatsapp': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.jobEntity.contacts?.whatsapp?.withoutCountryCode,
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, formGroup, child) => child!,
        child: Column(
          children: [
            Text(
              S.of(context).edit_job,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.cardColor,
                fontSize: AppFontSize.titleMedium,
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: EditJobForm(
                form: form,
                selectedJobType: selectedJobType,
                onJobTypeChanged: (newValue) {
                  setState(() {
                    selectedJobType = newValue;
                  });
                },
                jobEntity: widget.jobEntity,
              ),
            ),
            10.verticalSpace,
            EditJobButton(
              onEdit: _submitForm,
              isJobTypeSelected: selectedJobType != null,
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final jobEntity = widget.jobEntity.copyWith(
      jobTitleArabic: formControls['title_ar']!.value as String,
      jobTitleEnglish: formControls['title_eng']!.value as String,
      jobDescriptionArabic: formControls['description_ar']!.value as String,
      jobDescriptionEnglish: formControls['description_eng']!.value as String,
      type: selectedJobType!,
      workHours: int.parse(formControls['workHours']!.value as String),
      salary: double.parse(formControls['salary']!.value as String),
      contacts: widget.jobEntity.contacts?.copyWith(
        phoneNumber:
            (formControls['phoneNumber']!.value as String).withCountryCode,
      ),
      whatsapp: (formControls['whatsapp']!.value as String).withCountryCode,
    );

    context.read<JobsBloc>().add(EditJobEvent(jobEntity: jobEntity));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
