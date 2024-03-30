import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/media_query.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import 'add_property_form.dart';

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
        Validators.required,
        Validators.number,
      ]),
      'price': FormControl<String>(validators: [
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
            20.verticalSpace,
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return CustomElevatedButton(
                  label: S.of(context).post_now,
                  onPressed: (form.valid && selectedOfferType != null)
                      ? _submitForm
                      : null,
                  width: context.width,
                  height: 50.h,
                  borderRadius: BorderRadius.circular(8),
                );
              },
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
