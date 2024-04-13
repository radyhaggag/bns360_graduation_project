import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/features/properties/params/add_property_params.dart';
import 'package:bns360_graduation_project/features/properties/presentation/bloc/properties_bloc.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/add_property/add_property_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import 'add_property_form.dart';
import 'upload_proprty_images_section.dart';

class AddPropertyBody extends StatefulWidget {
  const AddPropertyBody({super.key});

  @override
  State<AddPropertyBody> createState() => _AddPropertyBodyState();
}

class _AddPropertyBodyState extends State<AddPropertyBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();

    form = FormGroup({
      'description': FormControl<String>(validators: [Validators.required]),
      'address': FormControl<String>(validators: [Validators.required]),
      'area': FormControl<String>(validators: [
        Validators.requiredTrue,
        Validators.number,
      ]),
      'price': FormControl<String>(validators: [
        Validators.requiredTrue,
        Validators.number,
      ]),
      'phoneNumber': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
        Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
      ]),
      'whatsapp': FormControl<String>(validators: [
        Validators.required,
        Validators.number,
        Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
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
        child: ListView(
          shrinkWrap: true,
          children: [
            AddPropertyForm(
              form: form,
              selectedOfferType: selectedOfferType,
              onOfferTypeChanged: (newValue) {
                setState(() {
                  selectedOfferType = newValue;
                });
              },
            ),
            10.verticalSpace,
            const UploadPropertyImagesSection(),
            20.verticalSpace,
            AddPropertyButton(
              onAdd: _submitForm,
              isOfferTypeSelected: selectedOfferType != null,
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final params = AddPropertyParams(
      address: formControls['address']!.value as String,
      description: formControls['description']!.value as String,
      area: double.parse(formControls['area']!.value as String),
      offerType: selectedOfferType!,
      price: double.parse(formControls['price']!.value as String),
      phoneNumber: formControls['phoneNumber']!.value as String,
      whatsapp: formControls['whatsapp']!.value as String,
    );
    context.read<PropertiesBloc>().add(AddPropertyEvent(
          addPropertyParams: params,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
