import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/shared_data/entities/job_entity.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/jobs/domain/params/add_job_params.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../generated/l10n.dart';
import 'add_job_button.dart';
import 'add_job_form.dart';

class AddJobBody extends StatefulWidget {
  const AddJobBody({
    super.key,
    required this.jobEntity,
  });

  final JobEntity? jobEntity;

  @override
  State<AddJobBody> createState() => _AddJobBodyState();
}

class _AddJobBodyState extends State<AddJobBody> {
  JobType? selectedJobType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    if (widget.jobEntity != null) {
      selectedJobType = JobType.fromInteger(widget.jobEntity!.workHours);
      context.read<JobsBloc>().add(
            InitJobRequirementsEvent(
              requirements: widget.jobEntity!.requirements,
            ),
          );
    }
    form = FormGroup({
      'title': FormControl<String>(
        validators: [Validators.required],
        value: widget.jobEntity?.jobTitle,
      ),
      'description': FormControl<String>(
        value: widget.jobEntity?.description,
      ),
      'workHours': FormControl<String>(
        validators: [
          Validators.requiredTrue,
          Validators.number,
        ],
        value: widget.jobEntity?.workHours.toString(),
      ),
      'salary': FormControl<String>(
        validators: [
          Validators.requiredTrue,
          Validators.number,
        ],
        value: widget.jobEntity?.salary.toString(),
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.jobEntity?.phoneNumber,
      ),
      'whatsapp': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.jobEntity?.whatsapp,
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
              widget.jobEntity != null
                  ? S.of(context).edit_post
                  : S.of(context).add_a_job,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.cardColor,
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: AddJobForm(
                form: form,
                selectedJobType: selectedJobType,
                onJobTypeChanged: (newValue) {
                  setState(() {
                    selectedJobType = newValue;
                  });
                },
              ),
            ),
            10.verticalSpace,
            AddJobButton(
              onAdd: _submitForm,
              isJobTypeSelected: selectedJobType != null,
              isUpdate: widget.jobEntity != null,
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final params = AddJobParams(
      title: formControls['title']!.value as String,
      description: formControls['description']!.value as String,
      jobType: selectedJobType!,
      requirements: [], // Will edited on the bloc
      workHours: int.parse(formControls['workHours']!.value as String),
      salary: double.parse(formControls['salary']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      whatsapp: formControls['whatsapp']!.value as String,
    );
    if (widget.jobEntity != null) {
      context.read<JobsBloc>().add(EditJobEvent(addJobParams: params));
    } else {
      context.read<JobsBloc>().add(AddJobEvent(addJobParams: params));
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
