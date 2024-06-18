import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../generated/l10n.dart';
import '../../../params/add_property_params.dart';
import '../../bloc/properties_bloc.dart';
import 'add_property_button.dart';
import 'add_property_form.dart';
import 'upload_property_images_section.dart';

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
      'description': FormControl<String>(
        validators: [Validators.required],
      ),
      'address': FormControl<String>(
        validators: [Validators.required],
      ),
      'area': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'price': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
      ),
      'whatsapp': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
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
            Text(
              S.of(context).add_property,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.cardColor,
                fontSize: AppFontSize.titleMedium,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
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
            10.verticalSpace,
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
      phoneNumber: (formControls['phoneNumber']!.value as String),
      whatsapp: (formControls['whatsapp']!.value as String),
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
