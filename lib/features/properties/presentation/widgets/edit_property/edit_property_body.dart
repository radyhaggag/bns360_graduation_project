import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/helpers/validators/form_validators.dart';
import '../../../../../core/shared_data/entities/property_entity.dart';
import '../../../../../core/utils/app_fonts.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/utils/extensions/strings.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/properties_bloc.dart';
import 'edit_property_button.dart';
import 'edit_property_form.dart';
import 'edit_property_images_section.dart';

class EditPropertyBody extends StatefulWidget {
  const EditPropertyBody({super.key, required this.propertyEntity});

  final PropertyEntity propertyEntity;

  @override
  State<EditPropertyBody> createState() => _EditPropertyBodyState();
}

class _EditPropertyBodyState extends State<EditPropertyBody> {
  OfferType? selectedOfferType;
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    selectedOfferType = widget.propertyEntity.type;
    form = FormGroup({
      'description_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.propertyEntity.arabicDescription,
      ),
      'description_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.propertyEntity.englishDescription,
      ),
      'address_ar': FormControl<String>(
        validators: [Validators.required],
        value: widget.propertyEntity.arabicAddress,
      ),
      'address_eng': FormControl<String>(
        validators: [Validators.required],
        value: widget.propertyEntity.englishAddress,
      ),
      'area': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.propertyEntity.area.toInt().toString(),
      ),
      'price': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
        ],
        value: widget.propertyEntity.price.toInt().toString(),
      ),
      'phoneNumber': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.propertyEntity.contacts.phoneNumber.withoutCountryCode,
      ),
      'whatsapp': FormControl<String>(
        validators: [
          Validators.required,
          Validators.number,
          Validators.pattern(FormValidator.phoneFormatWithoutCountryCode),
        ],
        value: widget.propertyEntity.contacts.whatsapp.withoutCountryCode,
      ),
    });

    if ((widget.propertyEntity.images).isNotEmpty) {
      context.read<PropertiesBloc>().add(InitNetworkPropertyImageEvent(
            networkImages: widget.propertyEntity.images,
          ));
    }
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
              S.of(context).edit_post,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.cardColor,
                fontSize: AppFontSize.titleMedium,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            EditPropertyForm(
              form: form,
              selectedOfferType: selectedOfferType,
              propertyEntity: widget.propertyEntity,
              onOfferTypeChanged: (newValue) {
                setState(() {
                  selectedOfferType = newValue;
                });
              },
            ),
            10.verticalSpace,
            const EditPropertyImagesSection(),
            20.verticalSpace,
            EditPropertyButton(
              isOfferTypeSelected: selectedOfferType != null,
              onEdit: _submitForm,
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final formControls = form.controls;
    final images = widget.propertyEntity.images;
    final propertyEntity = widget.propertyEntity.copyWith(
      arabicDescription: formControls['description_ar']!.value as String,
      englishDescription: formControls['description_eng']!.value as String,
      arabicAddress: formControls['address_ar']!.value as String,
      englishAddress: formControls['address_eng']!.value as String,
      area: int.parse(formControls['area']!.value as String),
      price: double.parse(formControls['price']!.value as String),
      contacts: widget.propertyEntity.contacts.copyWith(
        phoneNumber:
            (formControls['phoneNumber']!.value as String).withCountryCode,
        whatsapp: (formControls['whatsapp']!.value as String).withCountryCode,
      ),
      type: selectedOfferType!,
      image1: images.firstOrNull,
      image2: images.length > 1 ? images[1] : null,
      image3: images.length > 2 ? images[2] : null,
      image4: images.length > 3 ? images[3] : null,
    );

    context.read<PropertiesBloc>().add(EditPropertyEvent(
          propertyEntity: propertyEntity,
        ));
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}
