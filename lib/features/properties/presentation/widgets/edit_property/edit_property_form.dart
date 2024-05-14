import 'package:bns360_graduation_project/core/shared_data/entities/property_entity.dart';
import 'package:bns360_graduation_project/core/utils/extensions/price.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/property_location_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import '../property_offer_type_radio_tile.dart';

class EditPropertyForm extends StatelessWidget {
  const EditPropertyForm({
    super.key,
    required this.form,
    this.selectedOfferType,
    this.onOfferTypeChanged,
    this.propertyEntity,
  });

  final FormGroup form;
  final OfferType? selectedOfferType;
  final void Function(OfferType?)? onOfferTypeChanged;
  final PropertyEntity? propertyEntity;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: "${t.description_of_property}\t(${t.in_arabic})",
            hint: "${t.enter_property_address}\t(${t.in_arabic})",
            formControlName: 'description_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.description_of_property}\t(${t.in_english})",
            hint: "${t.enter_property_address}\t(${t.in_english})",
            formControlName: 'description_eng',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.property_address}\t(${t.in_arabic})",
            hint: "${t.enter_property_address}\t(${t.in_arabic})",
            formControlName: 'address_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.property_address}\t(${t.in_english})",
            hint: "${t.enter_property_address}\t(${t.in_english})",
            formControlName: 'address_eng',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          PropertyLocationSection(
            propertyEntity: propertyEntity,
          ),
          15.verticalSpace,
          const WhatsappAndMobileFields(),
          15.verticalSpace,
          PropertyOfferTypeRadioTile(
            value: selectedOfferType,
            onChanged: onOfferTypeChanged,
          ),
          20.verticalSpace,
          CustomReactiveFormField(
            title: t.price,
            hint: 00.toPrice(context),
            formControlName: 'price',
            isHorizontally: true,
            textFieldWidth: 100.w,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            separatorWidget: const Spacer(),
            textAlign: TextAlign.center,
            textStyle: context.textTheme.bodyMedium,
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.area,
            hint: t.meter_lone,
            formControlName: 'area',
            isHorizontally: true,
            textFieldWidth: 100.w,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            separatorWidget: const Spacer(),
            textAlign: TextAlign.center,
            textStyle: context.textTheme.bodyMedium,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
