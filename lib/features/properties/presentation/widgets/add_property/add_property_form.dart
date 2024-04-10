import 'package:bns360_graduation_project/core/utils/extensions/price.dart';
import 'package:bns360_graduation_project/features/properties/presentation/widgets/add_property/add_property_location_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/enums/offer_type.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../generated/l10n.dart';
import 'property_offer_type_radio_tile.dart';
import 'upload_proprty_images_section.dart';

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
          const AddPropertyLocationSection(),
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
            // textFieldHeight: 40.h,
            textStyle: context.textTheme.bodyMedium,
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.area,
            hint: t.meter_short,
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
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.phoneNumber,
            prefixText: "+20 ",
            hint: "+20 ",
            formControlName: 'phoneNumber',
            isHorizontally: true,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            textFieldWidth: .5.sw,
            textStyle: context.textTheme.bodyMedium,
            maxLength: 10,
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.whatsapp,
            prefixText: "+20 ",
            hint: "+20 ",
            formControlName: 'whatsapp',
            isHorizontally: true,
            keyboardType: TextInputType.number,
            isDigitsOnly: true,
            textFieldWidth: .5.sw,
            textStyle: context.textTheme.bodyMedium,
            maxLength: 10,
            textInputAction: TextInputAction.done,
          ),
          10.verticalSpace,
          const UploadPropertyImagesSection(),
        ],
      ),
    );
  }
}
