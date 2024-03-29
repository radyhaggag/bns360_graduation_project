import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'add_property_form.dart';

class AddPropertyBody extends StatefulWidget {
  const AddPropertyBody({super.key});

  @override
  State<AddPropertyBody> createState() => _AddPropertyBodyState();
}

class _AddPropertyBodyState extends State<AddPropertyBody> {
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
              child: AddPropertyForm(
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return CustomElevatedButton(
                      label: S.of(context).apply_now,
                      onPressed: (form.valid && selectedJobType != null)
                          ? _submitForm
                          : null,
                      width: context.width,
                      height: 50.h,
                      borderRadius: BorderRadius.circular(8),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {}

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
