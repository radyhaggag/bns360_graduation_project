import '../../../../../core/utils/extensions/price.dart';
import '../property_location_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import '../property_offer_type_radio_tile.dart';

class AddPropertyForm extends StatelessWidget {
  const AddPropertyForm({
    super.key,
    required this.form,
    this.selectedOfferType,
    this.onOfferTypeChanged,
  });

  final FormGroup form;
  final OfferType? selectedOfferType;
  final void Function(OfferType?)? onOfferTypeChanged;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: t.description_of_property,
            hint: t.enter_property_address,
            formControlName: 'description',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.property_address,
            hint: t.enter_property_address,
            formControlName: 'address',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          const PropertyLocationSection(),
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
