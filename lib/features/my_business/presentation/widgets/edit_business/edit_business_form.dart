import 'package:bns360_graduation_project/core/widgets/select_holiday_dropdown.dart';
import 'package:bns360_graduation_project/features/my_business/presentation/bloc/my_business_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../generated/l10n.dart';
import '../add_business_location_section.dart';
import '../add_business_time_section.dart';
import '../business_type_dropdown.dart';

class EditBusinessForm extends StatelessWidget {
  const EditBusinessForm({
    super.key,
    required this.form,
    required this.categoryItemEntity,
  });

  final FormGroup form;
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: "${t.business_name}\t(${t.in_arabic})",
            hint: "${t.enter_business_name}\t(${t.in_arabic})",
            formControlName: 'name_ar',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          CustomReactiveFormField(
            title: "${t.business_name}\t(${t.in_english})",
            hint: "${t.enter_business_name}\t(${t.in_english})",
            formControlName: 'name_eng',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          const BusinessTypeDropdown(),
          15.verticalSpace,
          CustomReactiveFormField(
            title: "${t.description_of_business}\t(${t.in_arabic})",
            hint: "${t.enter} ${t.description_of_business}\t(${t.in_arabic})",
            formControlName: 'description_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.description_of_business}\t(${t.in_english})",
            hint: "${t.enter} ${t.description_of_business}\t(${t.in_english})",
            formControlName: 'description_eng',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          CustomReactiveFormField(
            title: "${t.business_address}\t(${t.in_arabic})",
            hint: "${t.enter_business_address}\t(${t.in_arabic})",
            formControlName: 'address_ar',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          CustomReactiveFormField(
            title: "${t.business_address}\t(${t.in_english})",
            hint: "${t.enter_business_address}\t(${t.in_english})",
            formControlName: 'address_eng',
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
          15.verticalSpace,
          SelectHolidayDropdown(
            onChange: (holiday) {
              context.read<MyBusinessBloc>().add(
                    SelectBusinessHolidayEvent(holiday: holiday),
                  );
            },
          ),
        ],
      ),
    );
  }
}
