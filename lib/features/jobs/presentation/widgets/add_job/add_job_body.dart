import 'package:bns360_graduation_project/features/jobs/domain/params/add_job_params.dart';
import 'package:bns360_graduation_project/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/job_type.dart';
import 'add_job_button.dart';
import 'add_job_form.dart';

class AddJobBody extends StatefulWidget {
  const AddJobBody({super.key});

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
      'title': FormControl<String>(validators: [Validators.required]),
      'description': FormControl<String>(),
      'requirements': FormControl<String>(validators: [Validators.required]),
      'workHours': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
      ]),
      'salary': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
      ]),
      'phoneNumber': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
      ]),
      'whatsapp': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
      ]),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 15,
      ),
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, formGroup, child) => child!,
        child: Column(
          children: [
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
      requirements: formControls['requirements']!.value as String,
      jobType: selectedJobType!,
      workHours: int.parse(formControls['workHours']!.value as String),
      salary: double.parse(formControls['salary']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      whatsapp: formControls['whatsapp']!.value as String,
    );
    context.read<JobsBloc>().add(AddJobEvent(addJobParams: params));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
