import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import 'add_business_location_section.dart';
import 'add_business_time_section.dart';
import 'business_type_dropdown.dart';

class AddBusinessForm extends StatelessWidget {
  const AddBusinessForm({
    super.key,
    required this.form,
    this.categoryItemEntity,
  });

  final FormGroup form;
  final CategoryItemEntity? categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: t.business_name,
            hint: t.enter_business_name,
            formControlName: 'name',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          const BusinessTypeDropdown(),
          15.verticalSpace,
          CustomReactiveFormField(
            title: t.description_of_business,
            hint: t.enter_business_address,
            formControlName: 'description',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: t.business_address,
            hint: t.enter_business_address,
            formControlName: 'address',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          AddBusinessLocationSection(
            categoryItemEntity: categoryItemEntity,
          ),
          15.verticalSpace,
          const WhatsappAndMobileFields(
            viewWhatsapp: false,
          ),
          15.verticalSpace,
          const AddBusinessTimeSection(),
        ],
      ),
    );
  }
}
