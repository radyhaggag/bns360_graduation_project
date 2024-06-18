import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/helpers/validators/form_validators.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/job_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/strings.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/params/add_job_params.dart';
import '../../bloc/jobs_bloc.dart';
import 'add_job_button.dart';
import 'add_job_form.dart';

class AddJobBody extends StatefulWidget {
  const AddJobBody({
    super.key,
  });

  @override
  State<AddJobBody> createState() => _AddJobBodyState();
}

class _AddJobBodyState extends State<AddJobBody> {
  JobType? selectedJobType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'title': FormControl<String>(
        validators: [Validators.required],
      ),
      'description': FormControl<String>(),
      'workHours': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'salary': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
      ),
      'whatsapp': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
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
              S.of(context).add_a_job,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.cardColor,
                fontSize: AppFontSize.titleMedium,
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
            ),
            10.verticalSpace,
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
      requirements: [],
      // Will edited on the bloc
      workHours: int.parse(formControls['workHours']!.value as String),
      salary: double.parse(formControls['salary']!.value as String),
      phoneNumber:
          (formControls['phoneNumber']!.value as String).withCountryCode,
      whatsapp: (formControls['whatsapp']!.value as String).withCountryCode,
    );

    if (params.workHours > 24) {
      showToast(
        S.of(context).work_hours_should_be_less_than_24,
        ToastType.error,
      );
      return;
    }

    context.read<JobsBloc>().add(AddJobEvent(addJobParams: params));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
