import 'package:bns360_graduation_project/core/utils/extensions/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../../../core/widgets/input_fields/custom_reactive_input_field.dart';
import '../../../../../../core/widgets/input_fields/whatsapp_and_mobile_fields.dart';
import '../../../../../../generated/l10n.dart';
import '../../../bloc/my_services_bloc.dart';
import '../../add_service/add_service_time_section.dart';
import '../../add_service/service_type_dropdown.dart';
import '../../submit_service_button.dart';
import '../../upload_service_images_section.dart';

class EditServiceForm extends StatelessWidget {
  const EditServiceForm({
    super.key,
    required this.craftsmanEntity,
    required this.form,
  });

  final CraftsmanEntity craftsmanEntity;
  final FormGroup form;

  @override
  Widget build(BuildContext context) {
    final t = S.of(context);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          CustomReactiveFormField(
            title: "${t.user_name}\t(${t.in_arabic})",
            hint: "${t.enterName}\t(${t.in_arabic})",
            formControlName: 'name_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.user_name}\t(${t.in_english})",
            hint: "${t.enterName}\t(${t.in_english})",
            formControlName: 'name_en',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          const ServiceTypeDropdown(),
          15.verticalSpace,
          CustomReactiveFormField(
            title: "${t.enter} ${t.description}\t(${t.in_arabic})",
            hint: "${t.enter} ${t.description}\t(${t.in_arabic})",
            formControlName: 'description_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.enter} ${t.description}\t(${t.in_english})",
            hint: "${t.enter} ${t.description}\t(${t.in_english})",
            formControlName: 'description_en',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.your_address}\t(${t.in_arabic})",
            hint: "${t.enter_service_address}\t(${t.in_arabic})",
            formControlName: 'address_ar',
            textInputAction: TextInputAction.next,
          ),
          10.verticalSpace,
          CustomReactiveFormField(
            title: "${t.your_address}\t(${t.in_english})",
            hint: "${t.enter_service_address}\t(${t.in_english})",
            formControlName: 'address_en',
            textInputAction: TextInputAction.next,
          ),
          15.verticalSpace,
          const WhatsappAndMobileFields(
            viewWhatsapp: false,
          ),
          15.verticalSpace,
          const AddServiceTimeSection(),
          const SizedBox(height: 10),
          const UploadServiceImagesSection(),
          const SizedBox(height: 25),
          SubmitServiceButton(
            onAdd: () => _submitForm(context),
            isUpdate: true,
          ),
        ],
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final formControls = form.controls;

    final newData = craftsmanEntity.copyWith(
      nameAR: formControls['name_ar']!.value as String,
      nameEN: formControls['name_en']!.value as String,
      addressAR: formControls['address_ar']!.value as String,
      addressEN: formControls['address_en']!.value as String,
      descriptionAR: formControls['description_ar']!.value as String,
      descriptionEN: formControls['description_en']!.value as String,
      opening: int.parse(formControls['from']!.value as String),
      closing: int.parse(formControls['to']!.value as String),
      contact: craftsmanEntity.contact.copyWith(
        phoneNumber:
            (formControls['phoneNumber']!.value as String).withCountryCode,
      ),
    );

    context.read<MyServicesBloc>().add(UpdateServiceEvent(
          craftsmanEntity: newData,
        ));
  }
}
