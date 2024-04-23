import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/params/add_business_params.dart';
import '../../bloc/my_business_bloc.dart';
import 'add_business_form.dart';
import 'submit_business_button.dart';
import 'upload_business_images_section.dart';

class AddBusinessBody extends StatefulWidget {
  const AddBusinessBody({super.key});

  @override
  State<AddBusinessBody> createState() => _AddBusinessBodyState();
}

class _AddBusinessBodyState extends State<AddBusinessBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'name': FormControl<String>(
        validators: [Validators.required],
      ),
      'description': FormControl<String>(
        validators: [Validators.required],
      ),
      'address': FormControl<String>(
        validators: [Validators.required],
      ),
      'from': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'to': FormControl<String>(
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
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                S.of(context).add_business,
                style: context.textTheme.titleMedium,
              ),
            ),
            20.verticalSpace,
            AddBusinessForm(
              form: form,
            ),
            10.verticalSpace,
            const UploadMainBusinessImageSection(),
            10.verticalSpace,
            const UploadBusinessImagesSection(),
            20.verticalSpace,
            SubmitBusinessButton(
              onAdd: _submitForm,
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final params = AddBusinessParams(
      businessName: formControls['whatsapp']!.value as String,
      businessAddress: formControls['address']!.value as String,
      businessDescription: formControls['description']!.value as String,
      to: int.parse(formControls['to']!.value as String),
      from: int.parse(formControls['from']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      mainBusinessBackgroundImages: [], // Will updated on the bloc
      mainBusinessImage: "", // Will updated on the bloc
    );

    context.read<MyBusinessBloc>().add(AddBusinessEvent(
          addBusinessParams: params,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
